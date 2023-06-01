import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasource/task_remote_datasource.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final ITaskRemoteDatasource _datasource;

  TaskRepositoryImpl(this._datasource);
  @override
  Future<Either<DomainExeption, Unit>> addTask(TaskEntity task) async {
    try {
      await _datasource.addTask(task);
      return const Right(unit);
    } on DomainExeption catch (e) {
      return Left(DatasourceError(e.message));
    }
  }

  @override
  Future<Either<DomainExeption, List<TaskEntity>>> getTaskList() async {
    try {
      final taskList = await _datasource.getTasks();
      return Right(taskList);
    } on DatasourceError catch (e) {
      return Left(DatasourceError(e.message));
    }
  }

  @override
  Future<Either<DomainExeption, Unit>> taskCompleted({
    required bool isDone,
  }) async {
    try {
      await _datasource.taskCompleted(isDone: isDone);
      return const Right(unit);
    } on DatasourceError catch (e) {
      return Left(DatasourceError(e.message));
    }
  }
}
