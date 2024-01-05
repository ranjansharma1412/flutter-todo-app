import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?) onChange;
  Function(BuildContext?) onDeleteTask;

  TodoListItem(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange,
      required this.onDeleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDeleteTask,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8.0),
              backgroundColor: Colors.redAccent,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.purple),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                checkColor: Colors.white,
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Colors.purpleAccent),
                activeColor: Colors.purpleAccent,
              ),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
