import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malpav3/src/providers/auth_provider.dart';
import 'package:malpav3/src/models/user.dart';

class UserProvider {
  CollectionReference? _reference;
  // ignore: unused_field
  AuthProvider? _authProvider;
  UserProvider() {
    _reference = FirebaseFirestore.instance.collection('Users');
    _authProvider = AuthProvider();
  }
  Future<void> createUser(UserApp user) async {
    try {
      return await _reference!.doc(user.id).set(user.toJson());
    } catch (e) {
      debugPrint('### ERROR EN CREATUSER USERPROVIDER ###');
    }
  }

  Future<UserApp?> getByIdUserApp(String id) async {
    debugPrint('### GETBYIDUSERAPP $id ###');
    DocumentSnapshot document = await _reference!.doc(id).get();
    UserApp? user;
    if (document.exists) {
      user = UserApp.fromJson(document.data() as Map<String, dynamic>);
      return user;
    } else {
      return null;
    }
  }
}
