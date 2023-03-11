import 'dart:convert';
import 'package:app/src/mocks/task_mock.dart';
import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../service/prefs_service.dart';
import '../mocks/chat_filter_mock.dart';
import '../models/chat_filter_model.dart';

class Controller extends ChangeNotifier {
  final taskMock = TaskMock();
  final prefsService = PrefsService();
  final chatFilterMock = ChatFilterMock();
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();

  DateTime? newDate;
  TimeOfDay? newTime;

  List<double> altura = [355, 350, 345];
  List<bool> isOpen = [true, true, true];

  // List<TaskModel> newList = [];
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

  bool showInitialDate(DateTime dateTime) {
    if (dateTime.day == DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year) {
      return false;
    } else {
      return true;
    }
  }

  bool showInitialTime(TimeOfDay timeOfDay) {
    if (timeOfDay.hour == TimeOfDay.now().hour &&
        timeOfDay.minute == TimeOfDay.now().minute) {
      return false;
    } else {
      return true;
    }
  }

  void cleanFields() {
    titleTaskController.clear();
    descriptionTaskController.clear();
    timeOfDay = TimeOfDay.now();
    dateTime = DateTime.now();
  }

  // String overueTask(String dateAndTime) {
  //   final dayToday = DateTime.now().day;
  //   final monthToday = DateTime.now().month;
  //   final yearToday = DateTime.now().year;
  //   final hourNow = TimeOfDay.now().hour;
  //   final minuteNow = TimeOfDay.now().minute;

  //   final dataAndTimeAdded =
  //       dayToday + monthToday + yearToday + hourNow + minuteNow;

  //   print(dataAndTimeAdded);

  //   if (dateAndTime != '' || dateAndTime == null) {
  //     final intDateAndTime = int.parse(dateAndTime);
  //     if (intDateAndTime > dataAndTimeAdded) {
  //       print('blz');
  //     } else {
  //       print('poxa');
  //     }
  //     return dateAndTime;
  //   }
  //   return dateAndTime;
  // }

  Future<void> addTask() async {
    // final tasksLoaded = prefsService.loadTask();
    taskMock.taskList.add(
      TaskModel(
        title: titleTaskController.text,
        description: descriptionTaskController.text,
        dateAndTime:
            '${newDate!.day}/${newDate!.month}/${newDate!.year}\n${newTime!.hour}:${newTime!.minute}',
      ),
    );
    print(taskMock.taskList.length);

    final newList = taskMock.taskList;
    final stringNewList = jsonEncode(newList);
    await prefsService.saveTask(stringNewList);
    notifyListeners();
  }
}
