import 'package:app/stores/task_store.dart';

class FormController {
  final taskStore = TaskStore();

  String dateAndTime(DateTime date) {
    final dateAndTime =
        '${date.day}/${date.month}/${date.year}\n${date.hour}:${date.minute}';
    return dateAndTime;
  }
}
