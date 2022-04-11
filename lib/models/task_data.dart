import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(name: 'Buy Milk'),
    Tasks(name: 'Buy Bread'),
    Tasks(name: 'Buy Egg'),
  ];

  UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskLength {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Tasks(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void checkTask(Tasks tasks) {
    tasks.toggleDone();
    notifyListeners();
  }

  void deleteTask(Tasks tasks) {
    _tasks.remove(tasks);
    notifyListeners();
  }
}
