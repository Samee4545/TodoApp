import 'package:hive/hive.dart';

class TodoDataBase {
  List todoList = [];
  final _myBox = Hive.box('myBox');
  void createInitialData() {
    todoList = [
      ["Task 1", false],
      ["Task 2", false],
      ["Task 3", true],
      ["Task 4", false],
      ["Task 5", false],
    ];
  }

  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}
