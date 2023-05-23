import 'package:app/modules/home_module/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/task_entity.dart';
import '../errors/errors.dart';

abstract class IGetListTaskUsecase {
  Future<Either<DomainExeption, List<TaskEntity>>> call();
}

class GetTaskListUsecase implements IGetListTaskUsecase {
  final ITaskRepository _repository;

  const GetTaskListUsecase(this._repository);

  @override
  Future<Either<DomainExeption, List<TaskEntity>>> call() async {
    return _repository.getTaskList();
  }
}
