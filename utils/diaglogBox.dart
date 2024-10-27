import 'package:flutter/material.dart';
import 'package:to_do_app/utils/Button.dart';

class DiaglogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DiaglogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow,
        content: Container(
          height: 120,
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Add a new task"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Buttons(buttonName: "Save", onPressed: onSave),
                  SizedBox(
                    width: 10,
                  ),
                  Buttons(buttonName: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          ),
        ));
    ;
  }
}
