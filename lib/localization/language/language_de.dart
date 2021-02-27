import 'languages.dart';

class LanguageDe extends Languages {
  //Home Page
  @override
  String get warning => "Achtung!";
  @override
  String get sentenceAddAlertText =>
      'Bitte schreiben Sie einen Satz, um zu speichern';
  @override
  String get linkAddAlertText => 'Bitte schreiben Sie einen Link zum Speichern';
  @override
  String get takePictureAlertText => 'Kein Bild ausgewählt';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 =>
      'Schreiben Sie das Wort, das Sie sich merken möchten, und seine Bedeutung';
  @override
  String get word => 'Wort';
  @override
  String get meaning => 'Bedeutung';
  @override
  String get bodyInformation2 => 'Möchten Sie etwas über das Wort hinzufügen?';
  @override
  String get sentence => 'Satz';
  @override
  String get addButton => 'Hinzufügen';
  @override
  String get deleteButton => 'Löschen';
  @override
  String get ifImagePathNullText => 'Kein Bild ausgewählt';
  @override
  String get link => 'Verknüpfung';
  @override
  String get saveButton => 'SPAREN';
  @override
  String get saved => 'Wurde aufgenommen!';

  @override
  String get areYouSure => 'Bist du sicher?';
  @override
  String get wantToExit => 'Möchten Sie die App beenden?';
  @override
  String get longWord => 'Langes Wort';
  @override
  String get limit => 'Ein Wort darf 20 Buchstaben nicht überschreiten';
  @override
  String get yes => 'Ja';
  @override
  String get no => 'Nein';

  //Question Page
  @override
  String get error => 'Error';
  @override
  String get updateObjectAlertText => 'Ein unerwarteter Fehler ist aufgetreten';
  @override
  String get checkAlertText1 => 'Bitte schreiben Sie eine Antwort';
  @override
  String get checkAlertTitleWrongAnswer => 'Falsche Antwort';
  @override
  String get check => 'Prüfen';
  @override
  String get loading => 'Warten...';
  @override
  String get finish => 'Ausfahrt';
  @override
  String get windowWidgetText => 'Sie haben noch kein Wort hinzugefügt';
  @override
  String get menuWidgetText =>
      'Sie erhalten alle 1 Stunde eine Erinnerung von der Anwendung. Sie können das Zeitintervall ändern, wenn Sie möchten.';
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'Kopiert!';
  @override
  String get photo => 'Bild';
  @override
  String get noImageSelected => 'Kein Bild hinzugefügt';
  @override
  String get noPost => "Du hast nichts geschrieben";

  @override
  String get testResult => 'Testergebnis';
  @override
  String get correctText => "Anzahl der richtigen Antworten";
  @override
  String get wrongText => "Anzahl der falschen Antworten";
}
