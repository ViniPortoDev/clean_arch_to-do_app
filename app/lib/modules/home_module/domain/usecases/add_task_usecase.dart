import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:app/modules/home_module/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAddTaskUsecase {
  Future<Either<DomainExeption, Unit>> call(TaskEntity task);
}

class AddTaskUsecase implements IAddTaskUsecase {
  final ITaskRepository repository;
  const AddTaskUsecase(this.repository);
  @override
  Future<Either<DomainExeption, Unit>> call(TaskEntity task) async {
    return repository.addTask(task);
  }
}
