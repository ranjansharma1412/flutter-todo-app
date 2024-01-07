import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/components/dialogue_box.dart';
import 'package:todo_app/components/todo_list_item.dart';
import 'package:todo_app/data/database.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _controller = TextEditingController();
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var todoBox = Hive.box('todoBox');
    if (todoBox.get("TODO_LIST") == null) {
      db.createInitialTodoList();
    } else {
      db.loadData();
    }
  }

  void onTapCheckBox(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void _saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void _createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onSave: _saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'All Tasks',
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoListItem(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChange: (newValue) => onTapCheckBox(newValue, index),
            onDeleteTask: (buildContext) => deleteTask(index),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: _createNewTask,
          child: Icon(Icons.add),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
    );
  }
}
