import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/notes_model.dart';

class DatabaseHelper {
  final String _databaseName = "my_notes.db";
  final int _databaseVersion = 1;

  static DatabaseHelper? _databaseHelper;
  late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database;
  }

  // final String tableFolder = 'folder';
  final String tableNotes = 'notes';
  // final String tableSubFolder = 'subFolder';

  final String id = 'id';
  // final String title = 'title';
  // final String time = 'time';
  final String isFavorite = 'isFavorite';

  // final String noteId = 'noteId';
  // final String noteHeader = 'noteHeader';
  // final String note = 'note';
  // final String noteTime = 'noteTime';
  // final String noteIsFavorite = 'noteIsFavorite';
  // final String folderId = 'folderId';

  final String nameFile = 'file_name';
  final String rootId = 'root_id';
  final String type = 'type';
  final String createdTime = 'time';
  final String notes = 'notes';
  final String colorValue = 'color';

  // final String noteList = 'note_list';
  // final String subFolder = 'sub_folder';

  Future<Database> _initializeDB() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, onCreate: _onCreate, version: _databaseVersion);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableNotes (
        $id TEXT PRIMARY KEY,
        $nameFile TEXT NOT NULL,
        $notes TEXT,
        $rootId TEXT NOT NULL,
        $type INTEGER NOT NULL,
        $createdTime TEXT NOT NULL,
        $colorValue INTEGER,
        $isFavorite BOOLEAN NOT NULL
      )
      ''');
    // await db.execute('''
    //   CREATE TABLE $tableFolder (
    //     $id INTEGER PRIMARY KEY,
    //     $title TEXT NOT NULL,
    //     $time TEXT NOT NULL,
    //     $isFavorite BOOLEAN NOT NULL
    //   )
    //   ''');
    // db.execute('''
    //   CREATE TABLE $tableNotes (
    //     $noteId INTEGER PRIMARY KEY,
    //     $noteHeader TEXT NOT NULL,
    //     $note TEXT NOT NULL,
    //     $noteTime TEXT NOT NULL,
    //     $noteIsFavorite BOOLEAN NOT NULL,
    //     $folderId INTEGER NOT NULL,
    //     FOREIGN KEY ($folderId) REFERENCES $tableFolder ($id)
    //   )
    //   ''');

    // db.execute(
    //   'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $title TEXT, $time TEXT, $noteList TEXT NULL, $subFolder TEXT, $isFavorite BOOLEAN)',
    // );
  }

  Future<List<NotesModel>> getAllNotes() async {
    final Database db = await database;
    final data = await db.query(tableNotes);
    List<NotesModel> result = data.map((e) => NotesModel.fromJson(e)).toList();
    // print(result.first);
    return result;
  }

  // Future<List<FolderModel>> getFolders() async {
  //   final Database db = await database;
  //   final data = await db.query(tableFolder);
  //   List<FolderModel> result =
  //       data.map((e) => FolderModel.fromJson(e)).toList();
  //   // print(result.first);
  //   return result;
  // }

  Future<void> insertNotes(NotesModel notesModel) async {
    final Database db = await database;
    await db.insert(tableNotes, notesModel.toJson());
  }

  // Future<void> updateNotes(NotesModel notesModel) async {
  //   final Database db = await database;
  //   await db.update(tableNotes, notesModel.toJson());
  // }

  Future<List<NotesModel>> getNotesByFolderId(NotesModel notesModel) async {
    final Database db = await database;
    List<Map<String, dynamic>> allRows = await db.rawQuery(
        'SELECT * FROM $tableNotes WHERE $tableNotes.$rootId = "${notesModel.id}" AND $tableNotes.$type = 2');
    List<NotesModel> notes =
        allRows.map((contact) => NotesModel.fromJson(contact)).toList();
    return notes;
  }

  Future<List<NotesModel>> getSubFolderByFolderId(NotesModel notesModel) async {
    final Database db = await database;
    List<Map<String, dynamic>> allRows = await db.rawQuery(
        'SELECT * FROM $tableNotes WHERE $tableNotes.$rootId = "${notesModel.id}" AND $tableNotes.$type = 1');
    List<NotesModel> notes =
        allRows.map((contact) => NotesModel.fromJson(contact)).toList();
    return notes;
  }

  Future<List<NotesModel>> getFolderByRootId(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      tableNotes,
      where: '$rootId = ?',
      whereArgs: [id],
    );
    return results.map((e) => NotesModel.fromJson(e)).toList();
  }

  // Future<int> updateFolder(FolderModel folderModel) async {
  //   final db = await database;
  //   return await db.update(
  //     tableFolder,
  //     folderModel.toJson(),
  //     where: 'id = ?',
  //     whereArgs: [folderModel.id],
  //   );
  // }

  Future<int> deleteFolderNotes(String id) async {
    final Database db = await database;
    return await db.delete(
      tableNotes,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateNotes(NotesModel notesModel) async {
    final db = await database;
    return await db.update(
      tableNotes,
      notesModel.toJson(),
      where: 'id = ?',
      whereArgs: [notesModel.id],
    );
  }

  // Future<int> deleteNotes(int id) async {
  //   final Database db = await database;
  //   return await db.delete(
  //     tableNotes,
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<List<Map<String, dynamic>>> deleteNotes(NotesModel notesModel) async {
  //   final Database db = await database;
  //   return await db.rawQuery('''
  //     DELETE FROM $tableNotes
  //     WHERE $tableNotes.$root_id = ${notesModel.id} AND
  //     $tableNotes.$type = 1
  //     ''');
  // }

  // Future<List<NoteModel>> getNotes() async {
  //   final Database db = await database;
  //   final data = await db.query(tableNotes);
  //   List<NoteModel> result = data.map((e) => NoteModel.fromJson(e)).toList();
  //   // print(result.first);
  //   return result;
  // }

  // Future<List<NoteModel>> getNotes() async {
  //   final Database db = await database;
  //   final data = await db.query(tableNotes);
  //   List<NoteModel> result = data.map((e) => NoteModel.fromJson(e)).toList();
  //   // print(result.first);
  //   return result;
  // }

  // Future<void> insertNotes(NoteModel noteModel) async {
  //   final Database db = await database;
  //   await db.insert(tableNotes, noteModel.toJson());
  // }

  // Future<List<NotesModel>> getNotesByFolder(NotesModel folderModel) async {
  //   final Database db = await database;
  //   List<Map<String, dynamic>> allRows = await db.rawQuery('''
  //     SELECT * FROM $tableNotes
  //     WHERE $tableNotes.$root_id = ${folderModel.id} AND
  //     $type = 1
  //     ''');
  //   List<NotesModel> notes =
  //       allRows.map((contact) => NotesModel.fromJson(contact)).toList();
  //   return notes;
  // }

  // Future<int> deleteNotes(int id) async {
  //   final Database db = await database;
  //   return await db.delete(
  //     tableNotes,
  //     where: 'noteId = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> deleteAllNotes(int id) async {
  //   final Database db = await database;
  //   return await db.delete(
  //     tableNotes,
  //     where: 'folderId = ?',
  //     whereArgs: [id],
  //   );
  // }

  // // Future<int> deleteNotesFolder(int id) async {
  // //   final Database db = await database;
  // //   return await db.delete(
  // //     tableFolder,
  // //     where: 'id = ?',
  // //     whereArgs: [id],
  // //   );
  // // }
}
