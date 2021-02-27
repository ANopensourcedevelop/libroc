import 'languages.dart';

class LanguageIt extends Languages {
  //Home Page
  @override
  String get warning => "Attenzione";
  @override
  String get sentenceAddAlertText =>
      'Si prega di scrivere una frase per salvare';
  @override
  String get linkAddAlertText =>
      'Si prega di scrivere un collegamento per salvare';
  @override
  String get takePictureAlertText => 'Nessuna immagine selezionata';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 =>
      'Scrivi la parola che vuoi memorizzare e il suo significato';
  @override
  String get word => 'Parola';
  @override
  String get meaning => 'Significato';
  @override
  String get bodyInformation2 => 'Vorresti aggiungere qualcosa sulla parola?';
  @override
  String get sentence => 'Frase';
  @override
  String get addButton => 'Salva';
  @override
  String get deleteButton => 'Elimina';
  @override
  String get ifImagePathNullText => 'Nessuna immagine selezionata';
  @override
  String get link => 'Link';
  @override
  String get saveButton => 'SALVA';
  @override
  String get saved => 'Salvato!';

  @override
  String get areYouSure => 'Sei sicuro?';
  @override
  String get wantToExit => "Vuoi uscire dall'app?";
  @override
  String get longWord => 'Parola lunga';
  @override
  String get limit => 'Una parola non può superare le 20 lettere';
  @override
  String get yes => 'Si';
  @override
  String get no => 'No';

  //Question Page
  @override
  String get error => 'Errore';
  @override
  String get updateObjectAlertText => 'Si è verificato un errore imprevisto';
  @override
  String get checkAlertText1 => 'Si prega di scrivere una risposta';
  @override
  String get checkAlertTitleWrongAnswer => 'Risposta sbagliata';
  @override
  String get check => 'Occhiata';
  @override
  String get loading => 'Caricamento in corso...';
  @override
  String get finish => 'Uscita';
  @override
  String get windowWidgetText => 'Non hai ancora aggiunto una parola';
  @override
  String get menuWidgetText =>
      "Riceverai un promemoria ogni 1 ora dall'applicazione, puoi modificare l'intervallo di tempo se lo desideri.";
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'Copiato';
  @override
  String get photo => 'Immagine';
  @override
  String get noImageSelected => 'Nessuna immagine aggiunta';
  @override
  String get noPost => "Non hai scritto niente";

  @override
  String get testResult => 'Risultato della prova';
  @override
  String get correctText => "Numero di risposte corrette";
  @override
  String get wrongText => "Numero di risposte sbagliate";
}
