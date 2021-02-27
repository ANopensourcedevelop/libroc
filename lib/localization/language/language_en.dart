import 'languages.dart';

class LanguageEn extends Languages {
  //Home Page
  @override
  String get warning => "Warning";
  @override
  String get sentenceAddAlertText => 'Please write in a "sentence" to save';
  @override
  String get linkAddAlertText => 'Please write in a "Link" to save';
  @override
  String get takePictureAlertText => 'No image selected';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 => 'Write the word you want to memorize';
  @override
  String get word => 'Word';
  @override
  String get meaning => 'Meaning';
  @override
  String get bodyInformation2 =>
      'Would you like to add a something about this word?';
  @override
  String get sentence => 'Sentence';
  @override
  String get addButton => 'ADD';
  @override
  String get deleteButton => 'DELETE';
  @override
  String get ifImagePathNullText => 'No image selected.';
  @override
  String get link => 'Link';
  @override
  String get saveButton => 'SAVE';
  @override
  String get saved => 'Saved!';

  @override
  String get areYouSure => 'Are you sure?';
  @override
  String get wantToExit => 'Do you want to exit the app?';
  @override
  String get longWord => 'Long word';
  @override
  String get limit => 'A word cannot exceed 20 letters';
  @override
  String get yes => 'Yes';
  @override
  String get no => 'No';

  //Question Page
  @override
  String get error => 'Error';
  @override
  String get updateObjectAlertText => 'An unexpected error has occurred';
  @override
  String get checkAlertText1 => 'Please write an answer';
  @override
  String get checkAlertTitleWrongAnswer => 'Wrong answer';
  @override
  String get check => 'Check';
  @override
  String get loading => 'Loading...';
  @override
  String get finish => 'Finish';
  @override
  String get windowWidgetText => "You haven't added any words yet";
  @override
  String get menuWidgetText =>
      'You will receive a reminder notification every 1 hour from the application.If you want, you can change the time interval.';
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'Text copied';
  @override
  String get photo => 'Photo';
  @override
  String get noImageSelected => 'No image selected';
  @override
  String get noPost => "You didn't write anything";

  @override
  String get testResult => 'Test result';
  @override
  String get correctText => "The number of correct answers";
  @override
  String get wrongText => "The number of wrong answers";
}
