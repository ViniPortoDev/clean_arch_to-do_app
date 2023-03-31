import 'package:app/repositories/task_repositories.dart';
import 'package:app/src/controller/controller.dart';
import 'package:app/states/task_state.dart';
import 'package:flutter/cupertino.dart';
import '../src/models/task_model.dart';

class TaskStore extends ValueNotifier<TaskState> {
  List<TaskModel> taskList = [];
  final Controller controller;
  final taskDataBase = TaskDataBaseRepository();
  TaskStore({required this.controller}) : super(TaskInitialState());
  Future loadTasks() async {
    value = TaskLoadingState();

    await Future.delayed(const Duration(seconds: 1));
    try {
      final taskLoad = await taskDataBase.loadTask(taskList);
      value = TaskSucessState(taskLoad);
    } catch (e) {
      value = TaskErrorState(e.toString());
    }
  }

  Future<void> addTask() async {
    final list = await controller.addTask(taskDataBase, taskList);
    value = TaskSucessState(list);
  }

  Future<void> completeTask(int index) async {
    final newTaskList = controller.completeTask(index, taskList);
    await taskDataBase.saveTask(newTaskList);
    value = TaskSucessState(newTaskList);
  }

  Future<void> removeTask(int index) async {
    final newTaskList = controller.removeTask(index, taskList);
    await taskDataBase.saveTask(newTaskList);
    value = TaskSucessState(newTaskList);
  }
}
