import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'interface_local_storage.dart';

class PrefsService implements ILocalStorage {
  @override
  Future<bool> saveListMap({
    required String key,
    required List<Map<String, dynamic>> listMap,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final listMapJson = jsonEncode(listMap);
    final saved = await prefs.setString(key, listMapJson);
    return saved;
  }

  @override
  Future<List<Map<String, dynamic>>> getListMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final listMapJson = prefs.getString(key);
    if (listMapJson != null) {
      final listMap = jsonDecode(listMapJson);
     
      return listMap;
    }
    return [];
  }
}




  // @override
  // Future<bool> save(String json) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonSaved = await prefs.setString(
  //     PreferenceKeys.taskList,
  //     json,
  //   );
  //   return jsonSaved;
  // }

  // @override
  // Future<List<TaskModel>> get(List<dynamic> list) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final loadedTasksJson = prefs.getString(PreferenceKeys.taskList);
  //   if (loadedTasksJson != null) {
  //     final taskListJson = jsonDecode(loadedTasksJson);
  //     for (final i in taskListJson) {
  //       final index = jsonDecode(i);
  //       final task = TaskModel.fromMap(index);
  //       list.add(task);
  //     }
  //   }
  //   return list;
  // }