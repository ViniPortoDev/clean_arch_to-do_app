import 'package:app/service/interface_clound_storage.dart';

import 'package:app/utils/preference_keys.dart';
import '../modules/domain/entities/task_model.dart';
import '../service/interface_local_storage.dart';

class TaskDataBaseRepository {
  final ICloundStorageService _cloundStorageService;
  final ILocalStorageService _localStorageService;
  TaskDataBaseRepository(
    this._localStorageService,
    this._cloundStorageService,
  );

  Future saveTask(TaskModel task) async {
    await _cloundStorageService.saveDocs(
      collection: PreferenceKeys.taskList,
      doc: {
        'id': task.id,
        'title': task.title,
        'description': task.description,
        'date': task.date,
        'isDone': task.isDone,
      },
    );
  }

  Future<List<TaskModel>> loadTasks() async {
    final list = <TaskModel>[];
    final loadedTasks =
        await _localStorageService.getListMap(PreferenceKeys.taskList);

    for (final i in loadedTasks) {
      final task = TaskModel.fromMap(i);
      list.add(task);
    }
    return list;
  }
}
