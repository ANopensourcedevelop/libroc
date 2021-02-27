import 'languages.dart';

class LanguagePt extends Languages {
  //Home Page
  @override
  String get warning => "Atenção";
  @override
  String get sentenceAddAlertText => 'Por favor escreve uma frase para salvar';
  @override
  String get linkAddAlertText => 'Por favor escreve uma conexão para salvar';
  @override
  String get takePictureAlertText => 'Nenhuma imagem selecionado';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 => 'escreve uma palavra que quer memorizar';
  @override
  String get word => 'Palavra';
  @override
  String get meaning => 'Significado';
  @override
  String get bodyInformation2 => 'Quer adicionar alguma coisa na sua palavra?';
  @override
  String get sentence => 'Frase';
  @override
  String get addButton => 'Salva';
  @override
  String get deleteButton => 'Elimina';
  @override
  String get ifImagePathNullText => 'Nenhuma imagem selecionada';
  @override
  String get link => 'Link';
  @override
  String get saveButton => 'SALVA';
  @override
  String get saved => 'Salvo!';

  @override
  String get areYouSure => 'Você tem certeza?';
  @override
  String get wantToExit => 'Você quer sair do aplicativo?';
  @override
  String get longWord => 'Palavra longa';
  @override
  String get limit => 'Uma palavra não pode ter mais de 20 letras';
  @override
  String get yes => 'Sim';
  @override
  String get no => 'Não';

  //Question Page
  @override
  String get error => 'Error';
  @override
  String get updateObjectAlertText => 'Aconteceu um erro imprevisto';
  @override
  String get checkAlertText1 => 'Por favor escreve sua resposta';
  @override
  String get checkAlertTitleWrongAnswer => 'Resposta errada';
  @override
  String get check => 'Conferindo';
  @override
  String get loading => 'Carregando...';
  @override
  String get finish => 'Sair';
  @override
  String get windowWidgetText => 'Ainda não inseriu sua palavra';
  @override
  String get menuWidgetText =>
      "Riceberá uma notificação a cada 1 ora do aplicativo, você pode modificar  a notificação pelo tempo que preferir.";
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'Copiado';
  @override
  String get photo => 'Imagem';
  @override
  String get noImageSelected => 'Nenhuma imagem adicionado';
  @override
  String get noPost => "Campo vazio";

  @override
  String get testResult => 'Resultado do teste';
  @override
  String get correctText => "Número de respostas corretas";
  @override
  String get wrongText => "Número de respostas erradas";
}
