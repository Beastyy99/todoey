import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, child) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkBoxCallBack: (bool? checkBoxState) {
                taskData.checkTask(taskData.tasks[index]);
              },
              onLongPressCallback: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskLength,
          // children: const [TaskTile(), TaskTile(), TaskTile()],
        );
      },
    );
  }
}
