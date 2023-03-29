import 'dart:convert';

import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../service/prefs_service.dart';
import '../models/chat_filter_model.dart';

class Controller  {
  //TODO prefsService e taskList
  final prefsService = PrefsService();
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();

  List<TaskModel> taskList = [];

  String formatedDate() {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String formatedTime() {
    return '${timeOfDay.hour}:${timeOfDay.minute}';
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

  Color overdueTask(int index) {
    final time = taskList[index].time;
    final date = taskList[index].date;

    if (time != null && date != null) {
      return date.compareTo(DateTime.now()) == -1
          ? time.hour.compareTo(TimeOfDay.now().hour) == -1
              ? time.minute.compareTo(TimeOfDay.now().minute) == -1
                  ? const Color.fromARGB(255, 250, 66, 53)
                  : const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 255, 255, 255);
    }
    return Colors.white;
  }

  List<TaskModel> removeTask(int index) {
    taskList.removeAt(index);
    return taskList;
  }

  List<TaskModel> completeTask(int index) {
    taskList[index].isDone = !taskList[index].isDone;
    return taskList;
  }

  List<TaskModel> sortList(List<TaskModel> list) {
    if (list.length >= 2) {
      list
        ..sort((TaskModel a, TaskModel b) {
          return a.time!.minute.compareTo(b.time!.minute);
        })
        ..sort((TaskModel a, TaskModel b) {
          return a.time!.hour.compareTo(b.time!.hour);
        })
        ..sort((TaskModel a, TaskModel b) {
          return a.date!.compareTo(b.date!);
        });
      return list;
    }
    return list;
  }

  Future<List<TaskModel>> addTask() async {
    final dateAndTime =
        '${dateTime.day}/${dateTime.month}/${dateTime.year}\n${timeOfDay.hour}:${timeOfDay.minute}';
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      taskList.add(
        TaskModel(
          title: titleTaskController.text,
          description: descriptionTaskController.text,
          date: dateTime,
          time: timeOfDay,
          dateAndTime: dateAndTime,
        ),
      );
      final orderedTaskList = sortList(taskList);

      final taskListJson = jsonEncode(orderedTaskList);
      await prefsService.saveTask(taskListJson);

      return orderedTaskList;
    }
    return [];
  }
}
