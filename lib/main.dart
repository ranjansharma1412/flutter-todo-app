import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyles = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  static const List<Widget> _widgetoptions = <Widget> [
    TodoList(),
    Text('Index:1 Second screen', style: optionStyles),
    Text('Index:2 Third screen', style: optionStyles),
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TodoList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.line_axis), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTap,
      ),
    );
  }
}



