import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:app/modules/home_module/domain/repositories/task_repository.dart';
import 'package:app/modules/home_module/domain/usecases/get_task_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class GetListTaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  final _repository = GetListTaskRepositoryMock();
  final usecase = GetTaskListUsecase(_repository);
  group('getListTask Usecase', () {
    test('Deve retornar uma lista de TaskEntity', () async {
      final taskList = <TaskEntity>[];
      when(_repository.getTaskList).thenAnswer((_) async => Right(taskList));
      final result = await usecase();
      expect(result.fold(id, id), isA<List<TaskEntity>>());
    });
    test('Deve retornar um GetTaskListError quando a lista não for retornada',
        () async {
      when(_repository.getTaskList).thenAnswer(
        (_) async => const Left(GetTaskListError('Erro ao obter lista')),
      );
      final result = await usecase();
      expect(result.isLeft(), true);
    });
  });
}
