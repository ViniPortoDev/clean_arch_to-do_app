import 'package:app/modules/home_module/domain/errors/errors.dart';
import 'package:app/modules/home_module/external/service/remote_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreStorageService extends IRemoteStorageService {
  @override
  Future addDoc({
    required String collection,
    required Map<String, dynamic> doc,
  }) async {
    try {
      final instance = FirebaseFirestore.instance;
      await instance.collection(collection).doc().set(doc);
    } on FireStoreError catch (e) {
      return FireStoreError(e.message);
    }
  }

  @override
  Future getDocs({required String collection}) async {
 try {
      final instance = FirebaseFirestore.instance;

    await instance.collection(collection).doc().get();
 } on FireStoreError catch (e) {
      return FireStoreError(e.message);
    }
  }

  @override
  Future<void> changeDocs({
    required bool value,
    required String collection,
  }) async {
 try {
      final instance = FirebaseFirestore.instance;
    await instance.collection(collection).doc().update({'isDone': value});
 } on FireStoreError catch (e) {
       FireStoreError(e.message);
    }
  }
}
