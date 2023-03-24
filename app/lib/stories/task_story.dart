import 'dart:convert';

import 'package:app/service/prefs_service.dart';
import 'package:app/src/controller/controller.dart';
import 'package:app/src/models/task_model.dart';
import 'package:app/states/task_error_state.dart';
import 'package:app/states/task_initial_state.dart';
import 'package:app/states/task_loading_state.dart';
import 'package:app/states/task_state.dart';
import 'package:app/states/task_sucess_state.dart';
import 'package:flutter/cupertino.dart';

class TaskStory extends ValueNotifier<TaskState> {
  final Controller controller;
  final PrefsService prefsService = PrefsService();
  TaskStory({required this.controller}) : super(TaskInitialState());
  Future loadTasks() async {
    value = TaskLoadingState();

    await Future.delayed(const Duration(seconds: 1));
    try {
      final taskLoad = await prefsService.loadTask(controller.taskList);
      value = TaskSucessState(taskLoad);
    } catch (e) {
      value = TaskErrorState(e.toString());
    }
  }
  

  Future<void> addTask() async {
    final list = await controller.addTask();
    value = TaskSucessState(list);
  }

  Future<void> completeTask(int index) async {
    final newTaskList = controller.completeTask(index);
    final newTaskListJson = jsonEncode(newTaskList);
    await prefsService.saveTask(newTaskListJson);
    value = TaskSucessState(newTaskList);
  }

  Future<void> removeTask(int index) async {
    final newTaskList = controller.removeTask(index);
    final newTaskListJson = jsonEncode(newTaskList);
    await prefsService.saveTask(newTaskListJson);
    value = TaskSucessState(newTaskList);
  }


}
