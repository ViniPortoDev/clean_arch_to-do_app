// import 'dart:ffi';

// import 'package:app/modules/home_module/domain/entities/task_entity.dart';
// import 'package:app/modules/home_module/domain/errors/errors.dart';
// import 'package:app/modules/home_module/infra/datasource/task_remote_datasource.dart';
// import 'package:app/modules/home_module/infra/repositories/task_repository_impl.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:mocktail/mocktail.dart';

// class RemoteDatasourceMock extends Mock implements ITaskRemoteDatasource {}

// void main() {
//   late final ITaskRemoteDatasource iTaskRemoteDatasource;
//   late final TaskRepositoryImpl repository;
//   final task = TaskEntity(
//     title: 'title',
//     description: 'description',
//     date: DateTime(2023),
//     isDone: true,
//   );
//   setUpAll(() => null)
//   group('Implemetação TaskRepository.addTask', () {
//     test('deve retornar void quando adicionar tarefa', () async {
//       when(() => datasource.addTask(task)).thenAnswer((_) async {});
//       final result = await _repository.addTask(task);
//       expect(result.fold(id, id), isA<void>());
//     });
//     test('deve retornar um DatasourceError caso a tarefa não adicione',
//         () async {
//       when(() => _repository.addTask(task)).thenAnswer(
//         (_) async => const Left(DatasourceError('Erro ao adicionar tarefa')),
//       );
//       final result = await _repository.addTask(task);
//       expect(result.fold(id, id), isA<DatasourceError>());
//     });
//   });
// }
