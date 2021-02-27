import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  //Home page
  String get warning;
  String get sentenceAddAlertText;
  String get linkAddAlertText;
  String get takePictureAlertText;
  String get appBarTitle;
  String get bodyInformation1;
  String get word;
  String get meaning;
  String get bodyInformation2;
  String get sentence;
  String get addButton;
  String get deleteButton;
  String get ifImagePathNullText;
  String get link;
  String get saveButton;
  String get saved;
  String get areYouSure; //'Are you sure?'
  String get wantToExit; //'Do you want to exit an App?'
  String get yes;
  String get no;
  String get longWord;
  String get limit; //'A word cannot exceed 20 letters'

  //Question Page
  String get error;
  String get updateObjectAlertText;
  String get checkAlertText1;
  String get checkAlertTitleWrongAnswer;
  String get check;
  String get finish;
  String get windowWidgetText;
  String get menuWidgetText;
  String get one;
  String get three;
  String get five;
  String get loading;

  //Word Page
  String get textCopied;
  String get photo;
  String get noImageSelected;
  String get noPost;
  String get testResult; //'Test result'
  String get correctText; //'Number of correct answers'
  String get wrongText; //'Number of wrong answers'

}
