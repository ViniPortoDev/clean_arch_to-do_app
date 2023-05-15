abstract class ICloundStorageService {
  Future saveDocs({
    required String collection,
    required Map<String, dynamic> doc,
  });
  Future getDocs({required String collection});
}
