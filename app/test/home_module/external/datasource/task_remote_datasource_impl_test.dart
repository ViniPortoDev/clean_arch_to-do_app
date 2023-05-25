import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/external/datasource/task_remote_datasource_impl.dart';
import 'package:app/modules/home_module/external/service/remote_storage_service.dart';
import 'package:app/modules/home_module/infra/datasource/task_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FirestoreStorageServiceMock extends Mock
    implements IRemoteStorageService {}

void main() {
  late final ITaskRemoteDatasource taskRemoteDatasource;
  late final IRemoteStorageService remoteStorageService;
  final task = TaskEntity(
    title: 'title',
    description: 'description',
    date: DateTime(2023),
    isDone: true,
  );
  setUpAll(() {
    remoteStorageService = FirestoreStorageServiceMock();
    taskRemoteDatasource = RemoteDatasourceImpl(remoteStorageService);
  });
  setUp(() => registerFallbackValue(task));

  group('External datasource | addTask', ()  {
    test(
      'deve retornar void quando adicionar tarefa',
      () async {
        when(
          () => remoteStorageService.addDoc(collection: 'Tasks', doc: {}),
        ).thenAnswer((_) async {});
        final result =   taskRemoteDatasource.addTask(task);
        expect(result, Future.value());
      },
    );
  });
}
