import 'package:app/repositories/task_repositories.dart';
import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../models/chat_filter_model.dart';

class Controller {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  late bool isDone;

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

  String dateAndTime(DateTime date) {
    final dateAndTime =
        '${date.day}/${date.month}/${date.year}\n${date.hour}:${date.minute}';
    return dateAndTime;
  }

  Color overdueTask(DateTime date) {
    if (date.compareTo(DateTime.now()) == -1) {
      return Colors.red;
    }
    return Colors.white;
  }

  List<TaskModel> removeTask(int index, List<TaskModel> taskList) {
    taskList.removeAt(index);
    return taskList;
  }

  List<TaskModel> completeTask(int index, List<TaskModel> taskList) {
    isDone = taskList[index].isDone;
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
    taskList.add(
      TaskModel(
        title: titleTaskController.text,
        description: descriptionTaskController.text,
        date: dateTime,
        isDone: false,
      ),
    );
    final orderedTaskList = sortList(taskList);
    await service.saveTask(orderedTaskList);
    return orderedTaskList;
  }
}
