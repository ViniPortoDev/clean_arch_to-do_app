import 'dart:convert';

import 'package:app/repositories/task_repositories.dart';
import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../service/prefs_service.dart';
import '../models/chat_filter_model.dart';

class Controller {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool isDone = false;

  String dateAndTime(DateTime date) {
    final dateAndTime =
        '${date.day}/${date.month}/${date.year}\n${date.hour}:${date.minute}';
    return dateAndTime;
  }

  IconData getIcon(ChatFilterModel chatIcons) {
    switch (chatIcons.chatIcons) {
      case ChatIcons.allIbox:
        return LineIcons.comments;

      case ChatIcons.inbox:
        return Icons.inbox;

      case ChatIcons.bookmark:
        return Icons.bookmark_border;
    }
  }

  // Color overdueTask(int index) {

  //   final date = taskList[index].date;

  //   if (time != null && date != null) {
  //     return date.compareTo(DateTime.now()) == -1
  //         ? time.hour.compareTo(TimeOfDay.now().hour) == -1
  //             ? time.minute.compareTo(TimeOfDay.now().minute) == -1
  //                 ? const Color.fromARGB(255, 250, 66, 53)
  //                 : const Color.fromARGB(255, 255, 255, 255)
  //             : const Color.fromARGB(255, 255, 255, 255)
  //         : const Color.fromARGB(255, 255, 255, 255);
  //   }
  //   return Colors.white;
  // }

  List<TaskModel> removeTask(int index, List<TaskModel> taskList) {
    taskList.removeAt(index);
    return taskList;
  }

  List<TaskModel> completeTask(int index, List<TaskModel> taskList) {
    isDone = !isDone;
    final taskModel = taskList[index].copyWith(isDone: isDone);
    taskList[index] = taskModel;
    return taskList;
  }

  List<TaskModel> sortList(List<TaskModel> list) {
    if (list.length >= 2) {
      list.sort((TaskModel a, TaskModel b) {
        return a.date.compareTo(b.date);
      });
      return list;
    }
    return list;
  }

  Future<List<TaskModel>> addTask(
    TaskDataBaseRepository service,
    List<TaskModel> taskList,
  ) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      taskList.add(
        TaskModel(
          title: titleTaskController.text,
          description: descriptionTaskController.text,
          date: dateTime,
          isDone: isDone = false,
        ),
      );
      final orderedTaskList = sortList(taskList);
      await service.saveTask(orderedTaskList);
      return orderedTaskList;
    }
    return [];
  }
}
