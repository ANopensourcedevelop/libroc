import 'languages.dart';

class LanguageJp extends Languages {
  //Home Page
  @override
  String get warning => "注意";
  @override
  String get sentenceAddAlertText => '保存する文章を書いてください';
  @override
  String get linkAddAlertText => '保存するためのリンクを書いてください';
  @override
  String get takePictureAlertText => '画像が選択されていません';
  @override
  String get appBarTitle => 'LibroC';
  @override
  String get bodyInformation1 => '覚えたい単語とその意味を書いてください';
  @override
  String get word => '語';
  @override
  String get meaning => '意味';
  @override
  String get bodyInformation2 => 'その言葉に関連する何かを追加しますか？';
  @override
  String get sentence => '文';
  @override
  String get addButton => '追加';
  @override
  String get deleteButton => '削除';
  @override
  String get ifImagePathNullText => '画像が選択されていません';
  @override
  String get link => 'リンク';
  @override
  String get saveButton => 'セーブ';
  @override
  String get saved => '記録されました';

  @override
  String get areYouSure => '本気ですか？';
  @override
  String get wantToExit => 'アプリを終了しますか？';
  @override
  String get longWord => '長い言葉';
  @override
  String get limit => '単語は二十文字を超えることはできません';
  @override
  String get yes => 'はい';
  @override
  String get no => '番号';

  //Question Page
  @override
  String get error => 'エラー';
  @override
  String get updateObjectAlertText => '予期しないエラーが発生しました';
  @override
  String get checkAlertText1 => '答えを書いてください';
  @override
  String get checkAlertTitleWrongAnswer => '間違った答え';
  @override
  String get check => '小切手';
  @override
  String get loading => '待つ...';
  @override
  String get finish => '出口';
  @override
  String get windowWidgetText => 'まだ単語を追加していません';
  @override
  String get menuWidgetText =>
      'アプリケーションから1時間ごとにリマインダーが届きます。必要に応じて、時間間隔を変更できます。';
  @override
  String get one => '一';
  @override
  String get three => '三';
  @override
  String get five => '五';

  //Word Page
  @override
  String get textCopied => '保存しました！';
  @override
  String get photo => '画像';
  @override
  String get noImageSelected => '写真は追加されていません';
  @override
  String get noPost => "あなたは何かを書かなかった";

  @override
  String get testResult => 'テスト結果';
  @override
  String get correctText => "正解数";
  @override
  String get wrongText => "間違った答えの数";
}
