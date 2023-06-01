import 'package:fpdart/fpdart.dart';
import '../entities/task_entity.dart';
import '../errors/errors.dart';

abstract class ITaskRepository {
  Future<Either<DomainExeption, Unit>> addTask(TaskEntity task);
  Future<Either<DomainExeption, Unit>> taskCompleted({required bool isDone});
  Future<Either<DomainExeption, List<TaskEntity>>> getTaskList();
}
