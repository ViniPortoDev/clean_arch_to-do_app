import 'dart:convert';
import 'package:app/service/prefs_service.dart';
import 'package:app/src/controller/controller.dart';
import 'package:app/states/task_state.dart';
import 'package:flutter/cupertino.dart';

class TaskStore extends ValueNotifier<TaskState> {
  //TODO instancia do controller n pode existir, tem receber por parametro
  final Controller controller;
  final PrefsService prefsService = PrefsService();
  TaskStore({required this.controller}) : super(TaskInitialState());
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
