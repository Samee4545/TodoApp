import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?) onChanged;
  Function(BuildContext)? deleteTodo;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTodo,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              SizedBox(
                width: 10,
              ),
              Text(taskName,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
