import 'dart:convert';
import 'package:app/service/interface_database.dart';
import 'package:app/src/models/task_model.dart';
import 'package:app/utils/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService implements InterfaceDatabase {
  @override
  Future loadTask() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(PreferenceKeys.savedTask);

    if (data != null) {
      final Iterable dataJson = jsonDecode(data);
      final taskItemTraversed =
          dataJson.map((e) => TaskModel.fromJson(e)).toList();
      print(taskItemTraversed);
      
      return taskItemTraversed;
    }
  }

  @override
  Future saveTask(String taskList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      PreferenceKeys.savedTask,
      taskList,
    );
  }

  // @override
  // Future loadTask() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final task = prefs.getString(PreferenceKeys.savedTask);
  //   final taskMaps = jsonDecode(task!);

  //   print(taskMaps);

  // if (task != null) {
  //   final Map<String, dynamic> newTasks = jsonDecode(task);
  //   TaskModel(
  //     title: newTasks['title'],
  //     description: newTasks['description'],
  //     dateAndTime: newTasks['dateAndTime'],
  //     isDone: newTasks['isDone'],
  //   );
  //   // print(newTasks['title']);
  // }

  // Map<String, dynamic> newTasks = json.decode(salveeee!);
  // TaskModel taskModel = TaskModel.fromJson(newTasks);
}
