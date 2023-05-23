import 'package:app/modules/home_module/domain/usecases/get_task_list_usecase.dart';
import 'package:app/modules/home_module/domain/usecases/task_completed_usecase.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../infra/models/task_model.dart';
import 'states/task_state.dart';

class TaskStore extends ValueNotifier<TaskState> {
  final IAddTaskUsecase _addTaskUsecase;
  final GetTaskListUsecase _getTaskListUsecase;
  final TaskCompletedUsecase _taskCompletedUsecase;
  final List<TaskModel> _tasks = [];

  TaskStore(
    this._addTaskUsecase,
    this._getTaskListUsecase,
    this._taskCompletedUsecase,
  ) : super(TaskInitialState());

  Future<void> addTask(TaskModel task) async {
    await _addTaskUsecase(task);
    _sortList(_tasks);

    value = TaskSucessState(_tasks);
  }

  Future loadTasks() async {
    value = TaskLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      _tasks.clear();
      final taskList = _getTaskListUsecase;
      _tasks.addAll(taskList);
      value = TaskSucessState(taskList);
    } catch (e) {
      value = TaskErrorState(e.toString());
    }
  }

  Future<void> completeTask({
    required int index,
    required bool isDone,
  }) async {
    final status = !isDone;
    final taskModel = _tasks[index].copyWith(isDone: status);
    _tasks[index] = taskModel;

    value = TaskSucessState(_tasks);
  }

  Future<void> removeTask(int index) async {
    _tasks.removeAt(index);
    // await _taskRepository.saveTask(_tasks);
    value = TaskSucessState(_tasks);
  }

  List<TaskModel> _sortList(List<TaskModel> list) {
    if (list.length >= 2) {
      list.sort((TaskModel a, TaskModel b) {
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
}
