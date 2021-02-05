import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/modals/task_data.dart';
import 'package:toast/toast.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTextTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTextTitle = newText;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                if (newTextTitle.startsWith(' ') || newTextTitle.isEmpty) {
                  Toast.show('Task can\'t be empty.', context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                } else {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTextTitle);
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
