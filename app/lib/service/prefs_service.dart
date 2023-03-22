import 'dart:convert';
import 'package:app/service/interface_database.dart';
import 'package:app/src/models/task_model.dart';
import 'package:app/utils/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService implements InterfaceDatabase {
  @override
  Future saveTask(String json) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      PreferenceKeys.taskList,
      json,
    );
  }

  @override
  Future<List<TaskModel>> loadTask(List<TaskModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final loadedTasksJson = prefs.getString(PreferenceKeys.taskList);
    if (loadedTasksJson != null) {
      final taskListJson = jsonDecode(loadedTasksJson);
      for (final i in taskListJson) {
        final index = jsonDecode(i);
        final task = TaskModel.fromMap(index);
        list.add(task);
      }
    }
    return list;
  }
}
