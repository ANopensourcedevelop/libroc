import 'languages.dart';

class LanguageTr extends Languages {
  //Home Page
  @override
  String get warning => "Dikkat";
  @override
  String get sentenceAddAlertText => 'Lütfen kaydetmek için bir cümle yazın';
  @override
  String get linkAddAlertText => 'Lütfen kaydetmek için bir Link yazın';
  @override
  String get takePictureAlertText => 'Resim seçilmedi';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 =>
      'Ezberlemek istediğiniz kelimeyi ve anlamını yazın';
  @override
  String get word => 'Kelime';
  @override
  String get meaning => 'Anlamı';
  @override
  String get bodyInformation2 =>
      'Kelime ile ilgili birşeyler eklemek istermisiniz?';
  @override
  String get sentence => 'Cümle';
  @override
  String get addButton => 'Kaydet';
  @override
  String get deleteButton => 'Sil';
  @override
  String get ifImagePathNullText => 'Bir resim seçilmedi';
  @override
  String get link => 'Link';
  @override
  String get saveButton => 'KAYDET';
  @override
  String get saved => 'Kaydedildi!';

  @override
  String get areYouSure => 'Eminmisiniz?';
  @override
  String get wantToExit => 'Uygulamadan çıkmak istiyormusunuz?';
  @override
  String get longWord => 'Uzun kelime';
  @override
  String get limit => 'Bir kelime 20 harfi geçemez';
  @override
  String get yes => 'Evet';
  @override
  String get no => 'Hayır';

  //Question Page
  @override
  String get error => 'Hata';
  @override
  String get updateObjectAlertText => 'Beklenmeyen bir hata oluştu';
  @override
  String get checkAlertText1 => 'Lütfen bir cevap yazın';
  @override
  String get checkAlertTitleWrongAnswer => 'Yanlış cevap';
  @override
  String get check => 'Kontrol et';
  @override
  String get loading => 'Bekleyin...';
  @override
  String get finish => 'Çık';
  @override
  String get windowWidgetText => 'Henüz bir kelime eklemediniz';
  @override
  String get menuWidgetText =>
      'Uygulamadan her 1 saatte bir hatırlatma bildirimi alacaksınız, dilerseniz zaman aralığını değiştirebilirsiniz.';
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'Panoya kopyalandı';
  @override
  String get photo => 'Resim';
  @override
  String get noImageSelected => 'Bir resim eklenmedi';
  @override
  String get noPost => "Birşeyler yazmadınız";

  @override
  String get testResult => 'Test sonucu';
  @override
  String get correctText => "Doğru cevapların sayısı";
  @override
  String get wrongText => "Yanlış cevapların sayısı";
}
