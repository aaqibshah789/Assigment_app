// home.dart
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'model_student.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseHelper _databaseHelper;
  List<Student> _students = [];

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    _students = await _databaseHelper.getStudents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Database'),
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_students[index].name),
            subtitle: Text('Age: ${_students[index].age}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editStudentDialog(context, _students[index]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteStudent(_students[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addStudentDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addStudentDialog(BuildContext context) {
    String name = '';
    int age = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) {
                  age = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (name.isNotEmpty && age > 0) {
                  await _databaseHelper.insertStudent(Student(id: null, name: name, age: age));
                  _loadStudents();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editStudentDialog(BuildContext context, Student student) {
    String name = student.name;
    int age = student.age;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                controller: TextEditingController(text: student.name),
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) {
                  age = int.tryParse(value) ?? 0;
                },
                controller: TextEditingController(text: student.age.toString()),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (name.isNotEmpty && age > 0) {
                  student.name = name;
                  student.age = age;
                  await _databaseHelper.updateStudent(student);
                  _loadStudents();
                  Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _deleteStudent(Student student) async {
    await _databaseHelper.deleteStudent(student.id!);
    _loadStudents();
  }
}
