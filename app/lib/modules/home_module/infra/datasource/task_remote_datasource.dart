import 'package:app/modules/home_module/domain/entities/task_entity.dart';

abstract class ITaskRemoteDatasource {
  Future<void> addTask(TaskEntity task);
  Future<List<TaskEntity>> getTasks();
  Future<void> taskCompleted({required bool isDone});
}
