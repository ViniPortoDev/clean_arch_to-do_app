

import '../../../../domain/entities/task_entity.dart';

abstract class TaskState {
  const TaskState();
}

class TaskSucessState extends TaskState {
  final List<TaskEntity> tasks;
  const TaskSucessState(this.tasks);
}

class TaskErrorState extends TaskState {
  final String message;
  const TaskErrorState(this.message);
}

class TaskLoadingState extends TaskState {}

class TaskInitialState extends TaskState {}
