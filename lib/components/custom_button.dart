import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  VoidCallback onPress;

  CustomButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
