import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:app/modules/home_module/infra/datasource/task_remote_datasource.dart';
import 'package:app/modules/home_module/infra/repositories/task_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class RemoteDatasourceMock extends Mock implements ITaskRemoteDatasource {}

void main() {
  late final ITaskRemoteDatasource iTaskRemoteDatasource;
  late final TaskRepositoryImpl repository;
  final task = TaskEntity(
    title: 'title',
    description: 'description',
    date: DateTime(2023),
    isDone: true,
  );
  setUpAll(() {
    iTaskRemoteDatasource = RemoteDatasourceMock();
    repository = TaskRepositoryImpl(iTaskRemoteDatasource);
  });
  setUp(() => registerFallbackValue(task));
  group('Implemetação TaskRepository.addTask', () {
    test('deve retornar void quando adicionar tarefa', () async {
      when(() => iTaskRemoteDatasource.addTask(task)).thenAnswer((_) async {});
      final result = await repository.addTask(task);
      expect(result.fold(id, id), isA<void>());
    });
    test('deve retornar um DatasourceError caso a tarefa não adicione',
        () async {
      when(() => iTaskRemoteDatasource.addTask(any()))
          .thenThrow(const DatasourceError('Erro'));
      final result = await repository.addTask(task);
      expect(result.fold(id, id), isA<DomainExeption>());
    });
  });
}
