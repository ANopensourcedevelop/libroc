import 'languages.dart';

class LanguageFr extends Languages {
  //Home Page
  @override
  String get warning => "Attention";
  @override
  String get sentenceAddAlertText => 'Veuillez écrire une phrase à sauvegarder';
  @override
  String get linkAddAlertText => 'Veuillez écrire une lien à sauvegarder';
  @override
  String get takePictureAlertText => 'Aucune image sélectionnée';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 =>
      'Écrivez le mot que vous souhaitez mémoriser et sa signification';
  @override
  String get word => 'Mot';
  @override
  String get meaning => 'Sens';
  @override
  String get bodyInformation2 =>
      'Souhaitez-vous ajouter quelque chose en rapport avec le mot?';
  @override
  String get sentence => 'Phrase';
  @override
  String get addButton => 'Ajouter';
  @override
  String get deleteButton => 'Effacer';
  @override
  String get ifImagePathNullText => 'Aucune image sélectionnée';
  @override
  String get link => 'Lien';
  @override
  String get saveButton => 'ENREGISTRER';
  @override
  String get saved => 'A été enregistré!';

  @override
  String get areYouSure => 'Êtes-vous sûr?';
  @override
  String get wantToExit => "Voulez-vous quitter l'application?";
  @override
  String get longWord => 'Long mot';
  @override
  String get limit => 'Un mot ne peut pas dépasser 20 lettres';
  @override
  String get yes => 'Oui';
  @override
  String get no => 'Non';

  //Question Page
  @override
  String get error => 'Erreur';
  @override
  String get updateObjectAlertText => "Une erreur imprévue s'est produite";
  @override
  String get checkAlertText1 => 'Veuillez écrire une réponse';
  @override
  String get checkAlertTitleWrongAnswer => 'Mauvaise réponse';
  @override
  String get check => 'Vérifie ça';
  @override
  String get loading => 'Attendez...';
  @override
  String get finish => 'Sortie';
  @override
  String get windowWidgetText => "Vous n'avez pas encore ajouté un mot";
  @override
  String get menuWidgetText =>
      "Vous recevrez un rappel toutes les 1 heure de la part de l'application, vous pourrez modifier l'intervalle de temps si vous le souhaitez..";
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'Copié';
  @override
  String get photo => 'Image';
  @override
  String get noImageSelected => 'Aucune photo ajoutée';
  @override
  String get noPost => "Tu n'as rien écrit";

  @override
  String get testResult => 'Résultat du test';
  @override
  String get correctText => "Nombre de bonnes réponses";
  @override
  String get wrongText => "Nombre de mauvaises réponses";
}
