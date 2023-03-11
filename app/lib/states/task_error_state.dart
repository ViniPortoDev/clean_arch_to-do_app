import 'package:app/states/task_state.dart';

class TaskErrorState extends TaskState {
  final String message;

  TaskErrorState(this.message);
}
