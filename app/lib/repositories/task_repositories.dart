import 'package:app/src/models/task_model.dart';
import 'package:app/utils/preference_keys.dart';
import '../service/interface_local_storage.dart';

class TaskDataBaseRepository {
  final ILocalStorageService _storageService;
  const TaskDataBaseRepository(this._storageService);

  Future<bool> saveTask(List<TaskModel> taskList) async {
    final saved = await _storageService.saveListMap(
      key: PreferenceKeys.taskList,
      listMap: taskList.map((e) => e.toMap()).toList(),
    );
    return saved;
  }

  Future<List<TaskModel>> loadTasks() async {
    final list = <TaskModel>[];
    final loadedTasks =
        await _storageService.getListMap(PreferenceKeys.taskList);

    for (final i in loadedTasks) {
      final task = TaskModel.fromMap(i);
      list.add(task);
    }
    return list;
  }
}
