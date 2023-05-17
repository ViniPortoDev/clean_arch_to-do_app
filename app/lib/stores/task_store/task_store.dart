import 'package:app/repositories/task_repositories.dart';
import 'package:design_system/source/themes/my_theme.dart';
import 'package:flutter/material.dart';
import '../../modules/home_module/domain/entities/task_entity.dart';
import 'states/task_state.dart';

class TaskStore extends ValueNotifier<TaskState> {
  bool mode = true;
  final List<TaskEntity> _tasks = [];
  final TaskDataBaseRepository _taskRepository;
  TaskStore(this._taskRepository) : super(TaskInitialState());


  Future loadTasks() async {
    value = TaskLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      _tasks.clear();
      final loadedTasks = await _taskRepository.loadTasks();

      _tasks.addAll(loadedTasks);
      value = TaskSucessState(loadedTasks);
    } catch (e) {
      value = TaskErrorState(e.toString());
    }
  }

  Future<void> addTask(TaskEntity task) async {
    _tasks.add(task);
    _sortList(_tasks);
    await _taskRepository.saveTask(task);
    value = TaskSucessState(_tasks);
  }

  Future<void> completeTask({
    required int index,
    required bool isDone,
  }) async {
    final status = !isDone;
    final taskModel = _tasks[index].copyWith(isDone: status);
    _tasks[index] = taskModel;
    await _taskRepository.saveTask(taskModel);
    value = TaskSucessState(_tasks);
  }

  Future<void> removeTask(int index) async {
    _tasks.removeAt(index);
    // await _taskRepository.saveTask(_tasks);
    value = TaskSucessState(_tasks);
  }

  List<TaskEntity> _sortList(List<TaskEntity> list) {
    if (list.length >= 2) {
      list.sort((TaskEntity a, TaskEntity b) {
        return a.date.compareTo(b.date);
      });
      return list;
    }
    return list;
  }

  Color overdueTask(DateTime date) {
    if (date.compareTo(DateTime.now()) == -1) {
      return Colors.red;
    }
    return Colors.white;
  }

  String dateAndTime(DateTime date) {
    final dateAndTime =
        '${date.day}/${date.month}/${date.year}\n${date.hour}:${date.minute}';
    return dateAndTime;
  }

  ThemeData switchMode({required bool value}) {
    mode = value;
    if (mode) {
      return Mytheme.customDarkTheme;
    }
    return ThemeData.light();
  }
}
