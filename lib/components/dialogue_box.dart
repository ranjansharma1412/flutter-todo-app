import 'package:flutter/material.dart';
import 'package:todo_app/components/custom_button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purpleAccent,
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(text: "Save", onPress: onSave),
                  CustomButton(text: "Cancel", onPress: onCancel),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
