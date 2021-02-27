import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libroc/aboutMe.dart';
import 'package:libroc/functions.dart';
import 'package:libroc/localization/language/languages.dart';
import 'package:libroc/menuBook.dart';
import 'package:libroc/models/notes.dart';
import 'package:libroc/questionPage.dart';
import 'package:libroc/selectLanguagePage.dart';
import 'package:libroc/size.dart';
import 'package:libroc/utils/dbHelper.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;

import 'mywidgets.dart';

typedef IntCallback = Function(String x);
final textFieldValueWord = TextEditingController();
final textFieldValueMeaning = TextEditingController();
final textFieldValueSentence = TextEditingController();
final textFieldValueLink = TextEditingController();
var _myFunctions = Functions();
bool topColumn = true;
bool bottomContainer = true;
bool sentence = false;
bool photo = false;
bool link = false;
bool saveButton = true;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Notes> allNotes = List<Notes>();

  File _imagePath;
  final _formKey = GlobalKey<FormState>();
  FocusNode _focus = new FocusNode();
  String sentenceString;
  String linkString;
  String photoPathString;
  int correct;
  int wrong;
  int timeInterval;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _myFunctions.myGetNotificationTime();
    _focus.addListener(_onFocusChange);
  }

  void showOrHide(variable) {
    if (variable == 'sentence') {
      if (sentence == false) {
        bottomContainer = false;
        photo = false;
        link = false;
        sentence = true;
        saveButton = false;
      } else {
        sentence = false;
        topColumn = true;
        bottomContainer = true;
        saveButton = true;
        textFieldValueSentence.text = "";
      }
    } else if (variable == 'photo') {
      if (photo == false) {
        bottomContainer = false;
        sentence = false;
        link = false;
        saveButton = false;
        photo = true;
      } else {
        photo = false;
        topColumn = true;
        bottomContainer = true;
        saveButton = true;
      }
    } else if (variable == 'link') {
      if (link == false) {
        bottomContainer = false;
        sentence = false;
        photo = false;
        saveButton = false;
        link = true;
      } else {
        link = false;
        topColumn = true;
        bottomContainer = true;
        saveButton = true;
        textFieldValueLink.text = "";
      }
    }
  }

  _onFocusChange() {
    if (_focus.hasFocus == true) {
      if (textFieldValueWord.text.length > 15 ||
          textFieldValueMeaning.text.length > 15) {
        textFieldValueWord.clear();
        textFieldValueMeaning.clear();
      }
    }
    return _focus.hasFocus;
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (AppLifecycleState.paused == state) {
        _myFunctions.myNotification();
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldValueWord.dispose();
    textFieldValueMeaning.dispose();
    textFieldValueSentence.dispose();
    textFieldValueLink.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //--------------------------------------------------------------------------

  void saveObject() {
    setState(() {
      if (textFieldValueWord.text.trim().isNotEmpty ||
          textFieldValueMeaning.text.trim().isNotEmpty) {
        _addNote(
          Notes(
            textFieldValueWord.text.trim(),
            textFieldValueMeaning.text.trim(),
            sentenceString,
            photoPathString,
            linkString,
            correct,
            wrong,
          ),
        );
      } else {
        _myFunctions.myShowAlertDialog(context, Languages.of(context).warning,
            Languages.of(context).bodyInformation1);
      }
    });
  }

  //--------------------------------------------------------------------------

  void _addNote(Notes note) async {
    await databaseHelper.insert(note);
    setState(() {
      sentenceString = "";
      linkString = "";
      textFieldValueWord.text = "";
      textFieldValueMeaning.text = "";
      textFieldValueSentence.text = "";
      textFieldValueLink.text = "";
    });
  }

  //--------------------------------------------------------------------------

  //My voids
  void _updateForShowOrHide(String key) async {
    setState(() {
      showOrHide(key);
    });
  }

  void sentenceAdd() {
    if (textFieldValueSentence.text.isEmpty) {
      _myFunctions.myShowAlertDialog(context, Languages.of(context).warning,
          Languages.of(context).sentenceAddAlertText);
    } else {
      sentenceString = textFieldValueSentence.text.trim();
      textFieldValueSentence.text = "";
      _updateForShowOrHide('sentence');
    }
  }

  void linkAdd() {
    if (textFieldValueLink.text.isEmpty) {
      _myFunctions.myShowAlertDialog(context, Languages.of(context).warning,
          Languages.of(context).linkAddAlertText);
    } else {
      linkString = textFieldValueLink.text.trim();
      textFieldValueLink.text = "";
      _updateForShowOrHide('link');
    }
  }

  //--------------------------------------------------------------------------

  Future takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _imagePath = File(imageFile.path);
      final appDir = await sysPaths
          .getApplicationDocumentsDirectory(); //Get my application path
      final appDirPath = appDir.path;
      final fileName =
          path.basename(imageFile.path); //get filename from original file
      //String bgPath = appDir.uri.resolve(fileName).path;
      final savedImage = await File(imageFile.path)
          .copy('$appDirPath/$fileName'); //Copy image to application
      photoPathString = '$appDirPath/$fileName';
      _updateForShowOrHide('photo');
    } else {
      _myFunctions.myShowAlertDialog(context, Languages.of(context).warning,
          Languages.of(context).takePictureAlertText);
    }
  }

  Future<bool> _onWillPop() async {
    // BAck button
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(Languages.of(context).areYouSure),
            content: new Text(Languages.of(context).wantToExit),
            backgroundColor: Theme.of(context).accentColor,
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  Languages.of(context).no,
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
              new TextButton(
                onPressed: () {
                  _myFunctions.myNotification();
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                },
                child: new Text(
                  Languages.of(context).yes,
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  //--------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(Languages.of(context).appBarTitle),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuBook()),
                  );
                },
                icon: Icon(
                  Icons.menu_book,
                  color: Theme.of(context).accentColor,
                  size: displayHeight(context) * 0.04,
                ),
              ),
            ],
          ),
          drawer: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            width: displayWidth(context) * 0.2,
            height: displayHeight(context) * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionPage()),
                    );
                  },
                  icon: MyIcons(
                    iconName: Icons.extension,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutMe()),
                    );
                  },
                  icon: MyIcons(
                    iconName: Icons.contact_mail,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectLanguage()),
                      );
                    });
                  },
                  icon: MyIcons(
                    iconName: Icons.language,
                  ),
                ),
              ],
            ),
          ),
          body: Builder(builder: (context) {
            return ListView(
              children: [
                Visibility(
                  visible: topColumn,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).accentColor),
                        ),
                        child: MyText(
                          text: Languages.of(context).bodyInformation1,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 5),
                        child: Form(
                          key: _formKey,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: MyTextField(
                                  labelText: Languages.of(context).word,
                                  controller: textFieldValueWord,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.east,
                                    color: Color(0xFF568394),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: MyTextField(
                                  labelText: Languages.of(context).meaning,
                                  controller: textFieldValueMeaning,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).accentColor),
                        ),
                        child: MyText(
                          text: Languages.of(context).bodyInformation2,
                        ),
                      ),
                      Container(
                        margin:
                            //EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            EdgeInsets.only(
                                top: 15, bottom: 17, left: 5, right: 5),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  _updateForShowOrHide('sentence');
                                },
                                icon: MyIcons(
                                  iconName: Icons.create,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  takePicture();
                                  //getImage();
                                },
                                icon: MyIcons(
                                  iconName: Icons.insert_photo,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  _updateForShowOrHide('link');
                                },
                                icon: MyIcons(
                                  iconName: Icons.insert_link,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //First icon
                Visibility(
                  visible: bottomContainer,
                  child: MyHomeMediaContainer(
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: displayHeight(context) * 0.4,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                //Sentence
                Visibility(
                  visible: sentence,
                  child: MyHomeMediaContainer(
                    child: Column(
                      children: [
                        FocusScope(
                          child: Focus(
                            child: TextField(
                              controller: textFieldValueSentence,
                              maxLines: 7,
                              cursorColor: Theme.of(context).accentColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                labelText: Languages.of(context).sentence,
                                labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                            onFocusChange: (focus) => topColumn = false,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    sentenceAdd();
                                  },
                                  child: Text(Languages.of(context).addButton),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      sentenceString = "";
                                      _updateForShowOrHide('sentence');
                                    });
                                  },
                                  child:
                                      Text(Languages.of(context).deleteButton),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Insert photo
                Visibility(
                  visible: photo,
                  child: MyHomeMediaContainer(
                    child: Column(
                      children: [
                        Container(
                          child: _imagePath == null
                              ? Text(Languages.of(context).ifImagePathNullText)
                              : Image.file(_imagePath),
                          width: displayWidth(context) * 0.3,
                          height: displayHeight(context) * 0.3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _updateForShowOrHide('photo');
                                  },
                                  child: Text(Languages.of(context).addButton),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      photoPathString = "";
                                      _updateForShowOrHide('photo');
                                    });
                                  },
                                  child:
                                      Text(Languages.of(context).deleteButton),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Link
                Visibility(
                  visible: link,
                  child: MyHomeMediaContainer(
                    child: Column(
                      children: [
                        FocusScope(
                          child: Focus(
                            child: TextField(
                              controller: textFieldValueLink,
                              maxLines: 3,
                              cursorColor: Theme.of(context).accentColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                labelText: Languages.of(context).link,
                                labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                            onFocusChange: (focus) => topColumn = false,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    linkAdd();
                                  },
                                  child: Text(Languages.of(context).addButton),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      linkString = "";
                                      _updateForShowOrHide('link');
                                    });
                                  },
                                  child:
                                      Text(Languages.of(context).deleteButton),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Save button
                Visibility(
                  visible: saveButton,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        saveObject();
                        if (textFieldValueWord.text.trim().isNotEmpty ||
                            textFieldValueMeaning.text.trim().isNotEmpty) {
                          final snackBar = SnackBar(
                            content: Text(Languages.of(context).saved),
                            duration: const Duration(seconds: 2),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(Languages.of(context).saveButton),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        onWillPop: _onWillPop);
  }
}

class MyTextField extends StatelessWidget {
  final String labelText;
  final controller;
  const MyTextField({this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF568394),
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFF568394),
        ),
      ),
      style: TextStyle(color: Theme.of(context).accentColor),
      onChanged: (text) {
        if (textFieldValueWord.text.length > 20 ||
            textFieldValueMeaning.text.length > 20) {
          textFieldValueWord.clear();
          textFieldValueMeaning.clear();
          _myFunctions.myShowAlertDialog(context,
              Languages.of(context).longWord, Languages.of(context).limit);
        }
      },
    );
  }
}
