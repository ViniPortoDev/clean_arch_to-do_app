import '../src/models/task_model.dart';

abstract class InterfaceDatabase {
  Future loadTask(List<TaskModel> list) async {}
  Future saveTask(String json) async {}
}
