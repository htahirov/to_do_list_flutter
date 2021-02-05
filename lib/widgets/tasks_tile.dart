import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function toggleCheckBox;
  final Function onDeleteTap;

  TasksTile(
      {this.taskTitle, this.isChecked, this.toggleCheckBox, this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isChecked,
            activeColor: Colors.lightBlueAccent,
            onChanged: toggleCheckBox,
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: onDeleteTap,
          ),
        ],
      ),
    );
  }
}
