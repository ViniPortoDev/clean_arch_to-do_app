import 'package:flutter/material.dart';

import '../../stores/task_store.dart';

class ListController {
   final taskStore = TaskStore();
  Color overdueTask(DateTime date) {
    if (date.compareTo(DateTime.now()) == -1) {
      return Colors.red;
    }
    return Colors.white;
  }
}
