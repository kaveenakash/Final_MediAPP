import 'package:sqflite/sqflite.dart';

import '../models/reminder.dart';
import '../models/user.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "reminders";
  static final String _userTableName = "users";




  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "medicare.db";
      _db = await openDatabase(
        _path,
        version: _version,
          onCreate: (db, version) => _createDb(db),
      );
    } catch (e) {
      print(e);
    }
  }

  static void _createDb(Database db) async{
    print("creating a new one");
    db.execute('CREATE TABLE $_userTableName(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING,date STRING, gender STRING, color INTEGER)');
      // db.execute('CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING,time STRING,remind INTEGER, repeat STRING,color INTEGER,isCompleted INTEGER ,userId STRING ,FOREIGN KEY(userId) REFERENCES $_userTableName(id)');
    db.execute('CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING,time STRING,remind INTEGER, repeat STRING,color INTEGER,isCompleted INTEGER,userId STRING ,FOREIGN KEY(userId) REFERENCES $_userTableName(id))');
  }


  //reminder CRUD Operations
  static Future<int> insert(Reminder? reminder) async {
    print("insert function called");
    return await _db?.insert(_tableName, reminder!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("Query function called");
    return await _db!.query(_tableName);
  }

  static delete(Reminder reminder) async {
    return await _db!
        .delete(_tableName, where: 'id=?', whereArgs: [reminder.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
  UPDATE reminders
  SET isCompleted = ? 
  WHERE id=?
''', [1, id]);
  }



  //User CRUD Operations

  static Future<int> insertUser(User? user) async {
    print("insert user function called");
    return await _db?.insert(_userTableName, user!.toJson()) ?? 1;
    // return 1;
  }

  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    print("get All Users function called");
    return await _db!.query(_userTableName);
  }

  static updateUser(String name,String gender,int id) async {
    return await _db!.rawUpdate('''
  UPDATE users
  SET name = ?, gender = ?
  WHERE id=?
''', [name, gender ,id]);
  }
}
