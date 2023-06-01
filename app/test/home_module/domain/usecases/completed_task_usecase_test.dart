import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:app/modules/home_module/domain/repositories/task_repository.dart';
import 'package:app/modules/home_module/domain/usecases/task_completed_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class TaskCompletedRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  final _repository = TaskCompletedRepositoryMock();
  final usecase = TaskCompletedUsecase(_repository);
  group('completedTasks Usecase', () {
    test('Deve retornar um Unit quando a tarefa mudar de estado', () async {
      when(() => _repository.taskCompleted(isDone: true))
          .thenAnswer((_) async => const Right(unit));
      final result = await usecase(isDone: true);
      expect(result.fold(id, id), isA<Unit>());
    });
    test(
        '''Deve retornar um CompletedTaskError quando a tarefa não mudar de estado''',
        () async {
      const isDone = true;
      when(() => _repository.taskCompleted(isDone: isDone)).thenAnswer(
        (_) async => const Left(CompletedTaskError('Erro ao completar tarefa')),
      );
      final result = await usecase(isDone: isDone);
      expect(result.fold(id, id), isA<CompletedTaskError>());
    });
  });
}
