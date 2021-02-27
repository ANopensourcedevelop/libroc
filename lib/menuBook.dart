import 'package:flutter/material.dart';
import 'package:libroc/models/notes.dart';
import 'package:libroc/size.dart';
import 'package:libroc/utils/dbHelper.dart';
import 'package:libroc/wordPage.dart';

class MenuBook extends StatefulWidget {
  @override
  _MenuBookState createState() => _MenuBookState();
}

class _MenuBookState extends State<MenuBook> {
  var _controller = TextEditingController();
  FocusNode _focus = new FocusNode();
  List _listForSearch = List();
  var dimmi;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Notes> allNotes = List<Notes>();

  void getNotes() async {
    var notesFuture = databaseHelper.getAllNotes();
    await notesFuture.then((data) {
      setState(() {
        allNotes = data;
        allNotesFromVariables = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getNotes();
    _focus.addListener(_onFocusChange);
  }

  _onFocusChange() {
    //print("Focus: " + _focus.hasFocus.toString());
    if (_focus.hasFocus == false) {
      _controller.clear();
      _listForSearch.clear();
    }
    return _focus.hasFocus;
  }

  void _chooseWord() async {
    setState(() {
      _listForSearch.clear();
      if (allNotes.isNotEmpty) {
        for (int i = 0; i < allNotes.length; i++) {
          _forChoseWord(
              _controller.text, allNotes[i].word, allNotes[i].meaning);
          if (dimmi == true) {
            var map = {
              'id': allNotes[i].id,
              'word': allNotes[i].word,
              'meaning': allNotes[i].meaning,
              'sentence': allNotes[i].sentence,
              'photo': allNotes[i].photo,
              'link': allNotes[i].link,
              'correct': allNotes[i].correct,
              'wrong': allNotes[i].wrong
            };

            _listForSearch.add(map);

            print(_listForSearch[0]);
          }
        }
      }
    });
  }

  void _forChoseWord(controller, word, meaning) {
    setState(() {
      if (controller != null) {
        RegExp exp = new RegExp(controller); //Bunu
        String str = word + meaning; //Burda arar
        Iterable<RegExpMatch> matches = exp.allMatches(str);
        print('matches.isEmpty isledi ay ble');
        dimmi = matches.isNotEmpty; //true Icinde deyil
      }
    });
  }

  //----------------------------------------------------------

  void _deleteNote(int deletedNoteId, int deletedNoteIndex) async {
    await databaseHelper.delete(deletedNoteId);
    setState(() {
      getNotes();
    });
  }

  //----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: displayWidth(context) * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).accentColor,
          ),
          child: TextField(
            focusNode: _focus,
            controller: _controller,
            onChanged: (newText) {
              _chooseWord();
              print(_controller.text);
            },
            cursorColor: Theme.of(context).scaffoldBackgroundColor,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                  _listForSearch.clear();
                  _focus.unfocus();
                },
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF568394),
                ),
              ),
              labelStyle: TextStyle(
                color: Color(0xFF568394),
              ),
            ),
            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          child: _onFocusChange() != true
              ? ListView.builder(
                  itemCount: allNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            clickedNoteID = allNotes[index].id;
                            wordIndex = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WordPage()),
                            );
                          });
                        },
                        title: Text(
                          allNotes[index].word,
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: displayHeight(context) * 0.03,
                          ),
                        ),
                        subtitle: Text(
                          allNotes[index].meaning,
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: displayWidth(context) * 0.03,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            _deleteNote(allNotes[index].id, index);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    );
                  },
                )
              : secondBuildListView()),
    );
  }

  ListView secondBuildListView() {
    return ListView.builder(
      itemCount: _listForSearch.length,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).accentColor,
          child: ListTile(
            onTap: () {
              setState(() {
                clickedNoteID = _listForSearch[index]['id'];
                wordIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordPage()),
                );
              });
            },
            title: Text(
              _listForSearch.length != 0
                  ? _listForSearch[index]['word']
                  : 'No such word found',
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: displayWidth(context) * 0.05,
              ),
            ),
            subtitle: Text(
              _listForSearch.length != 0
                  ? _listForSearch[index]['meaning']
                  : 'No such word found',
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: displayWidth(context) * 0.05,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                _deleteNote(_listForSearch[index]['id'], index);
                _controller.text = '';
                _listForSearch.clear();
              },
              child: Icon(
                Icons.delete,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
