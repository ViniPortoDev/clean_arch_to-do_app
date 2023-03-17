import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../service/prefs_service.dart';
import '../models/chat_filter_model.dart';

class Controller extends ChangeNotifier {
  final prefsService = PrefsService();
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  DateTime? newDate;
  TimeOfDay? newTime;
  bool visibility = false;

  ValueNotifier<List<TaskModel>> taskList = ValueNotifier([]);

  String formatedDate() {
    return '${newDate?.day ?? '00'}/${newDate?.month ?? '00'}/${newDate?.year ?? '00'}';
  }

  String formatedTime() {
    return '${newTime?.hour ?? '00'}:${newTime?.minute ?? '00'}';
  }

  // String validatorTask() {
  //   if (newDate != null && newTime != null) {
  //     if (newDate!.isAfter(DateTime.now())) {
  //       if (newTime!.hour <= TimeOfDay.now().hour) {
  //         if (newTime!.minute < TimeOfDay.now().minute) {
  //           return 'Insira uma data futura';
  //         }
  //         return '2';
  //       }
  //     }
  //   }
  //   return '1';
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

  Future<void> addTask() async {
    final dateAndTime =
        '${newDate!.day}/${newDate!.month}/${newDate!.year}\n${newTime!.hour}:${newTime!.minute}';
    if (formKey.currentState!.validate()) {
      taskList.value.add(
        TaskModel(
          title: titleTaskController.text,
          description: descriptionTaskController.text,
          dateAndTime: dateAndTime,
        ),
      );

      // final newList = taskList;
      // final stringNewList = jsonEncode(newList);
      // await prefsService.saveTask(stringNewList);
      // notifyListeners();
    }
    notifyListeners();
  }

  // void cleanFields() {
  //   titleTaskController.clear();
  //   descriptionTaskController.clear();
  //   timeOfDay = TimeOfDay.now();
  //   dateTime = DateTime.now();
  // }
}
