import '../src/models/task_model.dart';

abstract class InterfaceDatabase {
  Future<List<TaskModel>> loadTask(List<TaskModel> list);
  Future saveTask(String json);
}
