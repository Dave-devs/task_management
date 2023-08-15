import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import '../note_model/note_model.dart';
import '../todo_model/todo_model.dart';


class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      "CREATE TABLE notes("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title STRING, description TEXT, date STRING,"
          "startTime STRING, endTime STRING,"
          "inProgress INTEGER, isCompleted INTEGER,"
          "reminder INTEGER, repeat STRING,"
          "picturePath STRING, audioPath String"
          ")"
    );

    await database.execute(
      "CREATE TABLE todos("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title STRING,todo TEXT, date STRING,"
          "startTime STRING, endTime STRING,"
          "inProgress INTEGER, isCompleted INTEGER,"
          "reminder INTEGER, repeat STRING,"
          "picturePath STRING, audioPath String"
          ")"
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "task_management_db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      }
    );
  }

  //Create NoteItem
  static Future<int> createNoteItem(
  String title,
  String description,
  String? date,
      ) async {
    final db = await DBHelper.db();

    final data = {
      'title': title,
      'description': description,
      'date': date,
    };

    final id = await db.insert('notes', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  // Create TodoItem
  static Future<int> createTodoItem(
    final String? title,
    final String? todo,
    final String? date,
      final String? startTime,
      final String? endTime
      ) async {
    final db = await DBHelper.db();

    final data = {
    'title': title,
    'todo': todo,
    'date': date,
      'startTime': startTime,
      'endTime': endTime
    };

    final id = await db.insert('todos', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  //Create GetNoteItem
  static Future<List<Map<String, dynamic>>> getNote(int id) async {
    final db = await DBHelper.db();

    return db.query(
        'notes',
        where: "id = ?",
        whereArgs: [id],
        limit: 1
    );
  }

  //Create GetTodoItem
  static Future<List<Map<String, dynamic>>> getTodo(int id) async {
    final db = await DBHelper.db();

    return db.query(
        'todos',
        where: "id = ?",
        whereArgs: [id],
        limit: 1
    );
  }

  //Create GetAllNotes
  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await DBHelper.db();

    return db.query("notes", orderBy: "id");
  }

  //Create GetAllTodos
  static Future<List<Map<String, dynamic>>> getTodos() async {
    final db = await DBHelper.db();

    return db.query("todos", orderBy: "id");
  }

  //Create Update Note
  static Future<int> updateNote(
  int id,
  String title,
  String description,
  String date,
  String startTime,
  String endTime,
  int? inProgress,
  int? isCompleted,
  int? reminder,
  String? repeat,
  String? picturePath,
  String? audioPath,
      ) async {
    final db = await DBHelper.db();

    final data = {
      "title": title,
      "description": description,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "inProgress": inProgress,
      "isCompleted": isCompleted,
      "reminder": reminder,
      "repeat": repeat,
      "picturePath": picturePath,
      "audioPath": audioPath,
    };

    final results = await db.update(
      "notes",
      data,
      where: "id = ?",
      whereArgs: [id]
    );

    return results;
  }

  //Create Update Todo
  static Future<int> updateTodo(
  int id,
  String title,
  String todo,
  String date,
  String startTime,
  String endTime,
  int? inProgress,
  int? isCompleted,
  int? reminder,
  String? repeat,
  String? picturePath,
  String? audioPath,
      ) async {
    final db = await DBHelper.db();

    final data = {
      "title": title,
      "description": todo,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "inProgress": inProgress,
      "isCompleted": isCompleted,
      "reminder": reminder,
      "repeat": repeat,
      "picturePath": picturePath,
      "audioPath": audioPath,
    };

    final results = await db.update(
      "todos",
      data,
      where: "id = ?",
      whereArgs: [id]
    );

    return results;
  }

  //Create Delete Note
  static Future<void> deleteNote(int id) async {
    final db = await DBHelper.db();

    try{
      db.delete("notes", where: "id = ?", whereArgs: [id]);
    } catch (e){
      if (kDebugMode) {
        print("Unable to delete $e");

      }}
  }

  //Create Delete Note
  static Future<void> deleteTodo(int id) async {
    final db = await DBHelper.db();

    try{
      db.delete("todos", where: "id = ?", whereArgs: [id]);
    } catch (e){
      if (kDebugMode) {
        print("Unable to delete $e");

      }}
  }
}