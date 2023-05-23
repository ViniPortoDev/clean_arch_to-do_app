import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:app/modules/home_module/domain/repositories/task_repository.dart';
import 'package:app/modules/home_module/domain/usecases/add_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  final _repository = TaskRepositoryMock();
  final usecase = IAddTaskUsecase(_repository);

  final task = TaskEntity(
    title: 'title',
    description: 'description',
    date: DateTime(2009),
    isDone: true,
  );

  group('addTask Usecase', () {
    test('Deve retornar um valor Unit quando adicionar uma tarefa', () async {
      when(() => _repository.addTask(task))
          .thenAnswer((_) async => const Right(unit));
      final result = await usecase(task);

      expect(
        result.fold(id, id),
        isA<Unit>(),
      );
    });
    test(
      'Deve retornar um AddTaskError quando adicionar a tarefa falhar',
      () async {
        when(() => _repository.addTask(task)).thenAnswer(
          (_) async => const Left(AddTaskError('Erro ao adicionar tarefa')),
        );
        final result = await usecase(task);
        expect(result.fold(id, id), isA<AddTaskError>());
      },
    );
  });
}
