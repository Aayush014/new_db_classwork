import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? database;


  // create database - init
  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    //appdata/android/new_db/
    final dbPath = join(path, 'emp.db');
    //appdata/android/new_db/emp.db
    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String query = ''' CREATE TABLE employee (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      salary REAL NOT NULL,
      role TEXT
      )
      ''';
        await db.execute(query);
      },
    );
    if(database==null)
      {
        print("------------database is not initialiazed---------------");
      }
    else
      {
        print("------------database is initialiazed---------------");
      }
    return database;
  }

  // INSERT DATA

  Future<void> insertData()
  async {
    String sql = '''INSERT INTO employee 
    (name,salary,role)
    VALUES("Darshan",1000,"DevC++")
    ''';
    await database!.rawInsert(sql);
  }

  Future<List<Map<String, Object?>>> fetchData()
  async {
    String sql = 'SELECT * FROM employee';
    Database? db = await initDatabase();
    if(db!=null)
      {
        return await db.rawQuery(sql);
      }
    else
      {
        print("-------------database is null------------------");
        return [];
      }

  }


}
// CREATE
// READ
// INSERT
// DELETE