import 'package:app/service/interface_clound_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreStorageService extends ICloundStorageService {
  @override
  Future saveDocs({
    required String collection,
    required Map<String, dynamic> doc,
  }) async {
    final instance = FirebaseFirestore.instance;
    await instance.collection(collection).doc().set(doc);
  }

  @override
  Future getDocs({required String collection}) async {
    final instance = FirebaseFirestore.instance;

    await instance.collection(collection).doc().get();
  }
}
