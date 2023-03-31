abstract class ILocalStorage {
  Future<bool> saveListMap({
    required String key,
    required List<Map<String, dynamic>> listMap,
  });
  Future<List<dynamic>> getListMap(String key);
}
