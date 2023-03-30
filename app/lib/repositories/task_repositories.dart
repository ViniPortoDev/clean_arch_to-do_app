import 'package:app/service/prefs_service.dart';
import 'package:app/src/models/task_model.dart';
import 'package:app/utils/preference_keys.dart';

class TaskDataBaseRepository {
  final PrefsService prefs = PrefsService();

  Future<bool> saveTask(List<TaskModel> taskList) async {
    final saved = await prefs.saveListMap(
      key: PreferenceKeys.taskList,
      listMap: taskList.map((e) => e.toMap()).toList(),
    );
    return saved;
  }

  Future<List<TaskModel>> loadTask(List<TaskModel> list) async {
    final loadedTasks = await prefs.getListMap(PreferenceKeys.taskList);

    for (final i in loadedTasks) {
      final task = TaskModel.fromMap(i);
      list.add(task);
    }
    return list;
  }
}
