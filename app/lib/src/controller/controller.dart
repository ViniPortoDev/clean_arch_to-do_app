import 'dart:convert';
import 'package:app/src/mocks/task_mock.dart';
import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../service/prefs_service.dart';
import '../models/chat_filter_model.dart';

class Controller extends ChangeNotifier {
  final taskMock = TaskMock();
  final prefsService = PrefsService();
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  DateTime? newDate;
  TimeOfDay? newTime;
  bool visibility = false;

  String formatedDate() {
    return '${newDate?.day ?? '00'}/${newDate?.month ?? '00'}/${newDate?.year ?? '00'}';
  }

  String formatedTime() {
    return '${newTime?.hour ?? '00'}:${newTime?.minute ?? '00'}';
  }

  String validatorTask() {
    if (newDate != null && newTime != null) {
      if (newDate!.day == DateTime.now().day &&
          newDate!.month == DateTime.now().month &&
          newDate!.year == DateTime.now().year) {
        if (newTime!.hour <= TimeOfDay.now().hour) {
          if  (newTime!.minute < TimeOfDay.now().minute) {
            return 'Insira uma data futura';
          }
          return '2';
        }
      }
    }
    return '1';
  }

  // void cleanFields() {
  //   titleTaskController.clear();
  //   descriptionTaskController.clear();
  //   timeOfDay = TimeOfDay.now();
  //   dateTime = DateTime.now();
  // }

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
    if (formKey.currentState!.validate()) {
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
}
