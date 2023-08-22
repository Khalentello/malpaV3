import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:malpav3/src/models/user.dart';

class UserProvider {
  CollectionReference? _collectionReference;
  UserProvider() {
    _collectionReference = FirebaseFirestore.instance.collection("users");
  }
  Future<void> createUser(UserModel userModel) async {
    try {
      return await _collectionReference!
          .doc(userModel.id)
          .set(userModel.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
