class Notes {
  int id;
  String word;
  String meaning;
  String sentence;
  String photo;
  String link;
  int correct;
  int wrong;


  Notes(this.word, this.meaning, this.sentence, this.photo, this.link,
      this.correct, this.wrong);

  Notes.withId(this.id, this.word, this.meaning, this.sentence, this.photo,
      this.link, this.correct, this.wrong);




  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["word"] = word;
    map["meaning"] = meaning;
    map["sentence"] = sentence;
    map["photo"] = photo;
    map["link"] = link;
    map["correct"] = correct;
    map["wrong"] = wrong;
    return map;
  }

  Notes.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.word = map["word"];
    this.meaning = map["meaning"];
    this.sentence = map["sentence"];
    this.photo = map["photo"];
    this.link = map["link"];
    this.correct = map["correct"];
    this.wrong = map["wrong"];
  }
}
