import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'interface_local_storage.dart';

class PrefsLocalStorageService implements ILocalStorageService {
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
  Future<List<dynamic>> getListMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final listMapJson = prefs.getString(key);
    if (listMapJson != null) {
      final listMap = jsonDecode(listMapJson);

      return listMap;
    }
    return [];
  }
}
