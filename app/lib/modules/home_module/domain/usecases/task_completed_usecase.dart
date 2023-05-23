import 'package:app/modules/home_module/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';

abstract class ITaskCompletedUsecase {
  Future<Either<DomainExeption, Unit>> call({required bool isDone});
}

class TaskCompletedUsecase implements ITaskCompletedUsecase {
  final ITaskRepository _repository;

  const TaskCompletedUsecase(this._repository);
  @override
  Future<Either<DomainExeption, Unit>> call({required bool isDone}) async {
    return _repository.taskCompleted(isDone: isDone);
  }
}
