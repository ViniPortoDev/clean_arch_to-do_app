import 'package:app/modules/home_module/domain/entities/task_entity.dart';
import 'package:app/modules/home_module/infra/datasource/task_remote_datasource.dart';

import '../service/firestore_service.dart';

class RemoteDatasourceImpl implements ITaskRemoteDatasource {
  final FirestoreStorageService service;
  const RemoteDatasourceImpl(this.service);
  @override
  Future<void> addTask(TaskEntity task) async {
    final taskMapped = {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'date': task.date,
      'isDone': task.isDone,
    };
    await service.addDoc(collection: 'Tasks', doc: taskMapped);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final List<TaskEntity> taskList =
        await service.getDocs(collection: 'Tasks');
    return taskList;
  }

  @override
  Future<void> taskCompleted({required bool isDone}) async {
    await service.changeDocs(value: isDone, collection: 'Tasks');
  }
}
