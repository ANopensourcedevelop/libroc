import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libroc/localization/language/languages.dart';
import 'package:libroc/size.dart';

int clickedNoteID;
int wordIndex;
List allNotesFromVariables;

class WordPage extends StatefulWidget {
  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswer = allNotesFromVariables[wordIndex].correct;
    int wrongAnswer = allNotesFromVariables[wordIndex].wrong;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: myText(context, allNotesFromVariables[wordIndex].word),
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(new ClipboardData(
                      text: allNotesFromVariables[wordIndex].word));
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(Languages.of(context).textCopied),
                  ));
                },
                child: myContainer(context, Languages.of(context).word,
                    allNotesFromVariables[wordIndex].word),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(new ClipboardData(
                      text: allNotesFromVariables[wordIndex].meaning));
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(Languages.of(context).textCopied),
                  ));
                },
                child: myContainer(context, Languages.of(context).meaning,
                    allNotesFromVariables[wordIndex].meaning),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(new ClipboardData(
                      text: allNotesFromVariables[wordIndex].sentence));
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(Languages.of(context).textCopied),
                  ));
                },
                child: myContainer(context, Languages.of(context).sentence,
                    allNotesFromVariables[wordIndex].sentence),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(new ClipboardData(
                      text: allNotesFromVariables[wordIndex].link));
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(Languages.of(context).textCopied),
                  ));
                },
                child: myContainer(context, Languages.of(context).link,
                    allNotesFromVariables[wordIndex].link),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).accentColor,
                margin: EdgeInsets.all(5),
                child: ListView(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          Languages.of(context).testResult,
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Languages.of(context).correctText,
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: displayHeight(context) * 0.03,
                            ),
                          ),
                          correctAnswer != null
                              ? Text(
                                  '$correctAnswer',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: displayHeight(context) * 0.03,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: displayHeight(context) * 0.03,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Languages.of(context).wrongText,
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: displayHeight(context) * 0.03,
                            ),
                          ),
                          wrongAnswer != null
                              ? Text(
                                  '$wrongAnswer',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: displayHeight(context) * 0.03,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: displayHeight(context) * 0.03,
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: allNotesFromVariables[wordIndex].photo == null
                    ? myContainer(context, Languages.of(context).photo,
                        Languages.of(context).noImageSelected)
                    : GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.file(
                                File(allNotesFromVariables[wordIndex].photo)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen();
                          }));
                        },
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Text myText(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: displayHeight(context) * 0.03,
      ),
    );
  }

  Container myContainer(BuildContext context, String text1, String text2) {
    return Container(
      color: Theme.of(context).accentColor,
      margin: EdgeInsets.all(5),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
              text1,
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: text2 == null
                  ? Text(
                      Languages.of(context).noPost,
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: displayHeight(context) * 0.03),
                    )
                  : Text(
                      text2,
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: displayHeight(context) * 0.03),
                    )),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.file(File(allNotesFromVariables[wordIndex].photo)),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
