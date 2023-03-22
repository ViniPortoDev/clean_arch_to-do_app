import 'dart:convert';

import 'package:app/service/prefs_service.dart';
import 'package:app/src/controller/controller.dart';
import 'package:app/states/task_error_state.dart';
import 'package:app/states/task_initial_state.dart';
import 'package:app/states/task_loading_state.dart';
import 'package:app/states/task_state.dart';
import 'package:app/states/task_sucess_state.dart';
import 'package:flutter/cupertino.dart';

import '../src/models/task_model.dart';

class TaskStory extends ValueNotifier<TaskState> {
  final controller = Controller();
  final PrefsService prefsService = PrefsService();
  TaskStory() : super(TaskInitialState());
  Future loadTasks() async {
    value = TaskLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final taskLoad = await prefsService.loadTask(controller.taskList);
      value = TaskSucessState(controller.taskList);
    } catch (e) {
      value = TaskErrorState(e.toString());
    }
  }

  // Future<void> addTask() async {
  //   // final dateAndTime =
  //   //     '${controller.newDate!.day}/${controller.newDate!.month}/${controller.newDate!.year}\n${controller.newTime!.hour}:${controller.newTime!.minute}';
  //   // if (controller.formKey.currentState!.validate()) {
  //   //   controller.taskList.value.add(
  //   //     TaskModel(
  //   //       title: controller.titleTaskController.text,
  //   //       description: controller.descriptionTaskController.text,
  //   //       dateAndTime: dateAndTime,
  //   //     ),
  //   //   );
  //   //   final taskListJson = jsonEncode(controller.taskList.value);
  //   //   await prefsService.saveTask(taskListJson);
  //   // }
  // }
}
