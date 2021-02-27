import 'package:libroc/models/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;

  String _notesTable = "notes";
  String _columnID = "id";
  String _columnWord = "word";
  String _columnMeaning = "meaning";
  String _columnSentence = "sentence";
  String _columnPhoto = "photo";
  String _columnLink = "link";
  String _columnCorrect = "correct";
  String _columnWrong = "wrong";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "notes.db");
    var notesDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return notesDb;
  }

  void createDb(Database db, int version) async {
    await db
        .execute("""Create table $_notesTable($_columnID integer primary key, 
        $_columnWord text, $_columnMeaning text, $_columnSentence text, 
        $_columnPhoto text, $_columnLink text, $_columnCorrect integer, 
        $_columnWrong integer)""");
  }

  // Crud Methods

  Future<List<Notes>> getAllNotes() async {
    Database db = await this.database;
    var result = await db.query("$_notesTable");
    return List.generate(result.length, (i) {
      return Notes.fromMap(result[i]);
    });
  }

  Future<int> insert(Notes note) async {
    Database db = await this.database;

    var result = await db.insert("$_notesTable", note.toMap());
    return result;
  }

  Future<int> update(Notes note) async {
    Database db = await this.database;

    var result = await db.update("$_notesTable", note.toMap(),
        where: "id=?", whereArgs: [note.id]);
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;

    var result = await db.rawDelete("delete from $_notesTable where id=$id");
    return result;
  }
}
