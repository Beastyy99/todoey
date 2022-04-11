import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {Key? key,
      required this.taskTitle,
      required this.isChecked,
      required this.checkBoxCallBack,
      required this.onLongPressCallback})
      : super(key: key);
  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkBoxCallBack;
  final Function()? onLongPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: onLongPressCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.lightBlueAccent,
          onChanged: checkBoxCallBack,
        ));
  }
}
