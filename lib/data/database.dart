
import 'package:hive_flutter/adapters.dart';

class TodoDataBase {
  List todoList = [];
  final todoBox = Hive.box('todoBox');

  void createInitialTodoList() {
    todoList = [
      ["List out today's task", false],
      ["Join stand-up call", false],
    ];
  }

  void loadData() {
    todoList = todoBox.get("TODO_LIST");
  }

  void updateData() {
    todoBox.put("TODO_LIST", todoList);
  }
}
