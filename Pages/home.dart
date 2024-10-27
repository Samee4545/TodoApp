import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/diaglogBox.dart';
import 'package:to_do_app/utils/todo_tiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('myBox');

  TodoDataBase db = TodoDataBase();

  // void initState() {
  //   if (_myBox.get("TODOLIST") == null) {
  //     db.createInitialData();
  //   }
  //   db.loadData();
  //   super.initState();
  // }
  void initState() {
    super.initState();
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
      // Save the initial data to Hive
    } else {
      db.loadData();
    }
  }

  void checkBoxChanged(bool? value, index) {
    setState(() {
      db.todoList[index][1] = value!;
    });
    db.updateDataBase();
  }

  final _controller = TextEditingController();
  CreateNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DiaglogBox(
          controller: _controller,
          onCancel: () {
            Navigator.pop(context);
          },
          onSave: () {
            setState(() {
              if (_controller.text == "") {
                return;
              }
              db.todoList.add([_controller.text, false]);
            });
            db.updateDataBase();
            _controller.clear();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "To Do",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.yellow,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: CreateNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
        ),
        body: ListView.builder(
            itemCount: db.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.todoList[index][0],
                taskCompleted: db.todoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteTodo: (
                  context,
                ) =>
                    deleteTask(index),
              );
            }));
  }
}
