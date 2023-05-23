abstract class IRemoteStorageService {
  Future<void> addDoc({
    required String collection,
    required Map<String, dynamic> doc,
  });
  Future<void> getDocs({required String collection});
  Future<void> changeDocs({required bool value, required String collection});

}
