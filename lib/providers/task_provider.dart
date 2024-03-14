import 'package:flutter/material.dart';

import '../entities/tasks.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider() {
    tasksList.addAll(Task.mockUpTasks); // Loading dummy data
  }

  final List<Task> tasksList = [];

  void addTask(Task task) {
    tasksList.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasksList.remove(task);
    notifyListeners();
  }

  void pinTask(Task task) {
    for (var task in tasksList) {
      if (task.isPinned) {
        task.isPinned = false;
      }
    }
    task.isPinned = true;
    notifyListeners();
  }
}
