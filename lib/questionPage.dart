import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libroc/functions.dart';
import 'package:libroc/localization/language/languages.dart';
import 'package:libroc/models/notes.dart';
import 'package:libroc/mywidgets.dart';
import 'package:libroc/size.dart';
import 'package:libroc/utils/dbHelper.dart';
import 'package:libroc/variables.dart';

var _myFunctions = Functions();
Color _menuColor1;
Color _menuColor3;
Color _menuColor5;

int _id;
String _word;
String _meaning;
String _sentence;
String _photoPath;
String _link;
int _wrong;
int _correct;
List _seen = [];
List _index = [];

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final _formKey = GlobalKey<FormState>();
  final textFieldValue = TextEditingController();
  int _allNotesLength;
  IconData icon;
  IconData icon2 = Icons.settings;
  bool _menu = false;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Notes> allNotes = List<Notes>();

  //----------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    getNotes();
    icon = Icons.psychology;
    _seen.clear();
    _myFunctions.myGetNotificationTime();
    print(Variables.hourFromVariables);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldValue.dispose();
    super.dispose();
  }

  Future<String> _loading = Future<String>.delayed(Duration(seconds: 1), () {
    String forFuture = _word;
    return forFuture;
  });

  void getNotes() async {
    var notesFuture = databaseHelper.getAllNotes();
    await notesFuture.then((data) {
      setState(() {
        allNotes = data;
        this._allNotesLength = allNotes.length;
        decision();
      });
    });
  }

  void _updateNote(Notes note) async {
    await databaseHelper.update(note);
    setState(() {
      getNotes();
      textFieldValue.text = "";
      _word = null;
      _meaning = null;
      _sentence = null;
      _photoPath = null;
      _link = null;
      _wrong = null;
      _correct = null;
    });
  }

  void updateObject() {
    if (_id != null) {
      if (_formKey.currentState.validate()) {
        _updateNote(Notes.withId(
          _id,
          _word,
          _meaning,
          _sentence,
          _photoPath,
          _link,
          _correct,
          _wrong,
        ));
      }
    } else {
      _myFunctions.myShowAlertDialog(context, Languages.of(context).error,
          Languages.of(context).updateObjectAlertText);
    }
  }

  wrongQuestion() {
    int control;
    _index.clear();
    if (allNotes.isNotEmpty) {
      for (int index = 0; index < _allNotesLength; index++) {
        Future.delayed(Duration.zero);
        if (allNotes[index].wrong == null ||
            allNotes[index].wrong < allNotes[index].wrong + 1) {
          if (_seen.contains(allNotes[index].id) == false) {
            _index.add(index);
            control = 1;
          }
        }
      }
    }
    if (control != null) {
      _id = allNotes[_index[0]].id;
      _word = allNotes[_index[0]].word;
      _meaning = allNotes[_index[0]].meaning;
      _sentence = allNotes[_index[0]].sentence;
      _photoPath = allNotes[_index[0]].photo;
      _link = allNotes[_index[0]].link;
      _wrong = allNotes[_index[0]].wrong;
      _correct = allNotes[_index[0]].correct;
      _seen.add(allNotes[_index[0]].id);
      _index.removeAt(0);
    } else {
      _id = null;
      _word = null;
      _meaning = null;
      _sentence = null;
      _photoPath = null;
      _link = null;
      _wrong = null;
      _correct = null;
    }
  }

  void randomQuestion() {
    if (allNotes.isNotEmpty) {
      Future.delayed(Duration.zero);
      int randomNumber = Random().nextInt(_allNotesLength);
      _id = allNotes[randomNumber].id;
      _word = allNotes[randomNumber].word;
      _meaning = allNotes[randomNumber].meaning;
      _sentence = allNotes[randomNumber].sentence;
      _photoPath = allNotes[randomNumber].photo;
      _link = allNotes[randomNumber].link;
      _wrong = allNotes[randomNumber].wrong;
      _correct = allNotes[randomNumber].correct;
    }
  }

  void decision() {
    setState(() {
      wrongQuestion();
      if (_word == null) {
        randomQuestion();
      }
    });
  }

  void check() {
    if (textFieldValue.text.trim().isEmpty) {
      _myFunctions.myShowAlertDialog(context, Languages.of(context).error,
          Languages.of(context).checkAlertText1);
      textFieldValue.text = "";
    } else if (_meaning == textFieldValue.text.trim()) {
      //Increase the wrong number by 1
      if (_correct == null) {
        _correct = 1;
      } else {
        _correct++;
      }
      //Update database
      updateObject();
      icon = Icons.done;
    } else {
      //Increase the wrong number by 1
      if (_wrong == null) {
        _wrong = 1;
      } else {
        _wrong++;
      }
      //Update database
      updateObject();
      icon = Icons.psychology;
      _myFunctions.myShowAlertDialog(
        context,
        Languages.of(context).checkAlertTitleWrongAnswer,
        '$_word = $_meaning',
      );
    }
  }

  //-------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return allNotes.isEmpty
        ? Window()
        : FutureBuilder(
            future: _loading,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Container(
                      child: IconButton(
                          icon: MyIcons(iconName: icon2),
                          onPressed: () {
                            setState(() {
                              if (_menu == false) {
                                icon2 = Icons.close;
                                _menu = true;
                                print(Variables.hourFromVariables);
                                if (Variables.hourFromVariables == null ||
                                    Variables.hourFromVariables == 1) {
                                  _menuColor1 = Colors.white;
                                  _menuColor3 = Theme.of(context).accentColor;
                                  _menuColor5 = Theme.of(context).accentColor;
                                } else if (Variables.hourFromVariables == 3) {
                                  _menuColor3 = Colors.white;
                                  _menuColor1 = Theme.of(context).accentColor;
                                  _menuColor5 = Theme.of(context).accentColor;
                                } else {
                                  _menuColor5 = Colors.white;
                                  _menuColor1 = Theme.of(context).accentColor;
                                  _menuColor3 = Theme.of(context).accentColor;
                                }
                              } else {
                                icon2 = Icons.settings;
                                _menu = false;
                              }
                            });
                          }),
                    ),
                  ),
                  body: _menu == false
                      ? ListView(
                          children: [
                            Container(
                              color: Theme.of(context).accentColor,
                              margin: EdgeInsets.symmetric(
                                  vertical: 80, horizontal: 20),
                              height: displayHeight(context) * 0.5,
                              child: Column(
                                children: [
                                  Container(
                                    child: Icon(
                                      icon,
                                      size: displayHeight(context) * 0.2,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  Container(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    height: displayHeight(context) * 0.09,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            Languages.of(context).word,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Container(
                                          child: Text(
                                            _word == null
                                                ? Languages.of(context).loading
                                                : _word,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.05),
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text('?',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          fontSize:
                                              displayHeight(context) * 0.03,
                                        )),
                                  ),
                                  Container(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    height: displayHeight(context) * 0.09,
                                    alignment: Alignment.center,
                                    child: Form(
                                      key: _formKey,
                                      child: TextField(
                                        controller: textFieldValue,
                                        cursorColor:
                                            Theme.of(context).accentColor,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF568394),
                                            ),
                                          ),
                                          labelText:
                                              Languages.of(context).meaning,
                                          labelStyle: TextStyle(
                                            color: Color(0xFF568394),
                                          ),
                                        ),
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: displayHeight(context) * 0.09,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                onPressed: check,
                                child: Text(Languages.of(context).check),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: displayHeight(context) * 0.09,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  _myFunctions.myNotification();
                                  Future.delayed(
                                      const Duration(milliseconds: 1000), () {
                                    SystemChannels.platform
                                        .invokeMethod('SystemNavigator.pop');
                                  });
                                },
                                child: Text(Languages.of(context).finish),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Menu(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
  }
}

class Window extends StatelessWidget {
  const Window({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          Languages.of(context).windowWidgetText,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    setStateForMenu1() {
      setState(() {
        if (Variables.hourFromVariables != 1) {
          _menuColor1 = Colors.white;
          _menuColor3 = Theme.of(context).accentColor;
          _menuColor5 = Theme.of(context).accentColor;
          Variables.hourFromVariables = 1;
          _myFunctions.insertNotificationTime(1);
        }
      });
    }

    setStateForMenu3() {
      setState(() {
        if (Variables.hourFromVariables != 3) {
          _menuColor3 = Colors.white;
          _menuColor1 = Theme.of(context).accentColor;
          _menuColor5 = Theme.of(context).accentColor;
          Variables.hourFromVariables = 3;
          _myFunctions.insertNotificationTime(3);
        }
      });
    }

    setStateForMenu5() {
      setState(() {
        if (Variables.hourFromVariables != 5) {
          _menuColor5 = Colors.white;
          _menuColor3 = Theme.of(context).accentColor;
          _menuColor1 = Theme.of(context).accentColor;
          Variables.hourFromVariables = 5;
          _myFunctions.insertNotificationTime(5);
        }
      });
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: MyText(text: Languages.of(context).menuWidgetText),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setStateForMenu1();
              },
              child:
                  myContainer(context, Languages.of(context).one, _menuColor1),
            ),
            GestureDetector(
              onTap: () {
                setStateForMenu3();
              },
              child: myContainer(
                  context, Languages.of(context).three, _menuColor3),
            ),
            GestureDetector(
              onTap: () {
                setStateForMenu5();
              },
              child:
                  myContainer(context, Languages.of(context).five, _menuColor5),
            )
          ],
        )
      ],
    );
  }

  Container myContainer(BuildContext context, text, color) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: displayHeight(context) * 0.1,
      width: displayWidth(context) * 0.1,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Text(text),
    );
  }
}
