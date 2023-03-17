import 'package:app/service/interface_database.dart';
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
  Future loadTask() async {
    // final prefs = await SharedPreferences.getInstance();
    // final data = prefs.getString(PreferenceKeys.savedTask);

    // if (data != null) {
    //   final Iterable dataJson = jsonDecode(data);
    //   final taskItemTraversed =
    //       dataJson.map((e) => TaskModel.fromJson(e)).toList();
    //   print(taskItemTraversed);
      
    //   return taskItemTraversed;
    // }
  }

 


}
