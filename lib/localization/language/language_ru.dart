import 'languages.dart';

class LanguageRu extends Languages {
  //Home Page
  @override
  String get warning => "Внимание";
  @override
  String get sentenceAddAlertText => 'Напишите предложение, чтобы сохранить';
  @override
  String get linkAddAlertText => 'Напишите пожалуйста ссылку для сохранения';
  @override
  String get takePictureAlertText => 'Картинка не выбрана';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 =>
      'Напишите слово, которое хотите запомнить, и его значение';
  @override
  String get word => 'слово';
  @override
  String get meaning => 'смысл';
  @override
  String get bodyInformation2 => 'Хотите добавить что-нибудь о слове?';
  @override
  String get sentence => 'Предложение';
  @override
  String get addButton => 'Добавить';
  @override
  String get deleteButton => 'Удалить';
  @override
  String get ifImagePathNullText => 'Картинка не выбрана';
  @override
  String get link => 'Ссылка';
  @override
  String get saveButton => 'СОХРАНИТЬ';
  @override
  String get saved => 'Было записано!';

  @override
  String get areYouSure => 'Ты уверен?';
  @override
  String get wantToExit => 'Вы хотите выйти из приложения?';
  @override
  String get longWord => 'Длинное слово';
  @override
  String get limit => 'Слово не может превышать 20 букв';
  @override
  String get yes => 'да';
  @override
  String get no => 'Нет';

  //Question Page
  @override
  String get error => 'ошибка';
  @override
  String get updateObjectAlertText => 'произошла неожиданная ошибка';
  @override
  String get checkAlertText1 => 'Напишите пожалуйста ответ';
  @override
  String get checkAlertTitleWrongAnswer => 'Неверный ответ';
  @override
  String get check => 'проверять';
  @override
  String get loading => 'Подождите...';
  @override
  String get finish => 'Выход';
  @override
  String get windowWidgetText => 'Вы еще не добавили ни слова';
  @override
  String get menuWidgetText =>
      'Вы будете получать напоминание от приложения каждые 1 час, вы можете изменить временной интервал, если хотите.';
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'скопировано';
  @override
  String get photo => 'Изображение';
  @override
  String get noImageSelected => 'Изображение не добавлено';
  @override
  String get noPost => "Ты что-то не писал";

  @override
  String get testResult => 'Результат испытаний';
  @override
  String get correctText => "Количество правильных ответов";
  @override
  String get wrongText => "Количество неправильных ответов";
}
