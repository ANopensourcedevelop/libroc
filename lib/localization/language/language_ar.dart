import 'languages.dart';

class LanguageAr extends Languages {
  //Home Page
  @override
  String get warning => "تحذير";
  @override
  String get sentenceAddAlertText => 'يرجى كتابة "جملة" للحفظ';
  @override
  String get linkAddAlertText => 'يرجى كتابة "رابط" للحفظ';
  @override
  String get takePictureAlertText => 'لم يتم اختيار أي صورة';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 => 'اكتب الكلمة التي تريد حفظها';
  @override
  String get word => 'كلمة';
  @override
  String get meaning => 'المعنى';
  @override
  String get bodyInformation2 => 'هل ترغب في إضافة شيء عن هذه الكلمة؟';
  @override
  String get sentence => 'جملة او حكم على';
  @override
  String get addButton => 'أضف';
  @override
  String get deleteButton => 'حذف';
  @override
  String get ifImagePathNullText => 'لم يتم اختيار أي صورة.';
  @override
  String get link => 'حلقة الوصل';
  @override
  String get saveButton => 'حفظ';
  @override
  String get saved => 'تم الحفظ!';

  @override
  String get areYouSure => 'هل أنت واثق؟';
  @override
  String get wantToExit => 'هل تريد الخروج من التطبيق؟';
  @override
  String get longWord => 'كلمة طويلة';
  @override
  String get limit => 'لا يمكن للكلمة أن تتجاوز عشرين حرفًا';
  @override
  String get yes => 'نعم';
  @override
  String get no => 'لا';

  //Question Page
  @override
  String get error => 'خطأ';
  @override
  String get updateObjectAlertText => 'لقد حدث خطأ غير متوقع';
  @override
  String get checkAlertText1 => 'الرجاء كتابة إجابة';
  @override
  String get checkAlertTitleWrongAnswer => 'إجابة خاطئة';
  @override
  String get check => 'التحقق من';
  @override
  String get loading => 'جار التحميل...';
  @override
  String get finish => 'إنهاء';
  @override
  String get windowWidgetText => "لم تقم بإضافة أي كلمات حتى الآن";
  @override
  String get menuWidgetText =>
      'سيصلك إشعار تذكير كل ساعة من التطبيق ، إذا أردت يمكنك تغيير الفاصل الزمني.';
  @override
  String get one => '١';
  @override
  String get three => '٣';
  @override
  String get five => '٥';

  //Word Page
  @override
  String get textCopied => 'تم نسخ النص';
  @override
  String get photo => 'صورة فوتوغرافية';
  @override
  String get noImageSelected => 'لم يتم اختيار أي صورة';
  @override
  String get noPost => "أنت لم تكتب أي شيء";

  @override
  String get testResult => 'نتيجة الفحص';
  @override
  String get correctText => "عدد الإجابات الصحيحة";
  @override
  String get wrongText => "عدد الإجابات الخاطئة";
}
