import '../../../src/models/task_model.dart';

abstract class TaskState {
  const TaskState();
}

class TaskSucessState extends TaskState {
  final List<TaskModel> tasks;
  const TaskSucessState(this.tasks);
}

class TaskErrorState extends TaskState {
  final String message;
  const TaskErrorState(this.message);
}

class TaskLoadingState extends TaskState {}

class TaskInitialState extends TaskState {}
