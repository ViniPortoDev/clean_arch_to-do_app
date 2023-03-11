import 'package:app/src/models/task_model.dart';
import 'package:app/states/task_state.dart';

class TaskSucessState extends TaskState {
  final List<TaskModel> tasks;

  TaskSucessState(this.tasks);
}
