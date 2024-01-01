import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_list_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  
  List _todoList = [
    ["First task", false],
    ["Second task", false],
    ["Third task", false],
  ];

  void onTapCheckBox(bool? value, int index){
    setState(() {
    _todoList[index][1]=!_todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Center(
          child: Text('All Tasks', style: TextStyle(color: Colors.white, fontSize: 24),textAlign: TextAlign.center,),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return TodoListItem(taskName: _todoList[index][0], taskCompleted: _todoList[index][1], onChange:(newValue)=>onTapCheckBox(newValue,index));
          },
        )
      ),
    );
  }
}
