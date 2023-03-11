import 'package:app/service/prefs_service.dart';
import 'package:app/states/task_error_state.dart';
import 'package:app/states/task_initial_state.dart';
import 'package:app/states/task_loading_state.dart';
import 'package:app/states/task_state.dart';
import 'package:app/states/task_sucess_state.dart';
import 'package:flutter/cupertino.dart';

class TaskStory extends ValueNotifier<TaskState> {
  final PrefsService prefsService;
  TaskStory(this.prefsService) : super(TaskInitialState());
  Future prefsLoad() async {
    value = TaskLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final taskLoad = await prefsService.loadTask();

      value = TaskSucessState(taskLoad);
    } catch (e) {
      value = TaskErrorState(e.toString());
    }
  }
}
