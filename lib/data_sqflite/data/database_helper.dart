// database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model_student.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'students_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertStudent(Student student) async {
    await initDatabase();
    await _database.insert(
      'students',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Student>> getStudents() async {
    await initDatabase();
    final List<Map<String, dynamic>> maps = await _database.query('students');

    return List.generate(maps.length, (i) {
      return Student.fromMap(maps[i]);
    });
  }

  Future<void> updateStudent(Student student) async {
    await initDatabase();
    await _database.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<void> deleteStudent(int id) async {
    await initDatabase();
    await _database.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
