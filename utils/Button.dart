import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  Buttons({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonName),
      color: Colors.yellow,
    );
  }
}
