import 'languages.dart';

class LanguageIn extends Languages {
  //Home Page
  @override
  String get warning => "ध्यान";
  @override
  String get sentenceAddAlertText => 'कृपया बचाने के लिए एक वाक्य लिखें';
  @override
  String get linkAddAlertText => 'कृपया सहेजने के लिए एक लिंक लिखें';
  @override
  String get takePictureAlertText => 'कोई चित्र नहीं चुना गया';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 =>
      'उस शब्द को लिखें जिसे आप याद रखना चाहते हैं और उसका अर्थ';
  @override
  String get word => 'शब्द';
  @override
  String get meaning => 'अर्थ';
  @override
  String get bodyInformation2 => 'क्या आप शब्द के बारे में कुछ जोड़ना चाहेंगे?';
  @override
  String get sentence => 'वाक्य';
  @override
  String get addButton => 'जोड़ते हैं';
  @override
  String get deleteButton => 'हटा दें';
  @override
  String get ifImagePathNullText => 'कोई चित्र नहीं चुना गया';
  @override
  String get link => 'संपर्क';
  @override
  String get saveButton => 'बचा ले';
  @override
  String get saved => 'रिकॉर्ड किया गया था!';

  @override
  String get areYouSure => 'क्या आपको यकीन है?';
  @override
  String get wantToExit => 'क्या आप ऐप से बाहर निकलना चाहते हैं?';
  @override
  String get longWord => 'लंबा शब्द';
  @override
  String get limit => 'एक शब्द बीस अक्षरों से अधिक नहीं हो सकता';
  @override
  String get yes => 'हाँ';
  @override
  String get no => 'नहीं न';

  //Question Page
  @override
  String get error => 'त्रुटि';
  @override
  String get updateObjectAlertText => 'एक अनपेक्षित त्रुटि हो गई है';
  @override
  String get checkAlertText1 => 'कृपया एक उत्तर लिखें';
  @override
  String get checkAlertTitleWrongAnswer => 'गलत जवाब';
  @override
  String get check => 'यह जाँचें';
  @override
  String get loading => 'रुको...';
  @override
  String get finish => 'बाहर जाएं';
  @override
  String get windowWidgetText => 'आपने अभी तक एक शब्द नहीं जोड़ा है';
  @override
  String get menuWidgetText =>
      'आपको आवेदन से हर 1 घंटे में एक रिमाइंडर मिलेगा, आप चाहें तो समय अंतराल बदल सकते हैं।';
  @override
  String get one => '1';
  @override
  String get three => '3';
  @override
  String get five => '5';

  //Word Page
  @override
  String get textCopied => 'नकल की गई!';
  @override
  String get photo => 'चित्र';
  @override
  String get noImageSelected => 'कोई चित्र नहीं जोड़ा गया';
  @override
  String get noPost => "आपने कुछ नहीं लिखा";

  @override
  String get testResult => 'परीक्षा परिणाम';
  @override
  String get correctText => "सही उत्तरों की संख्या";
  @override
  String get wrongText => "गलत उत्तरों की संख्या";
}
