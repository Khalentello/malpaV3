import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;
  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth!
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint('### ERROR METODO LOGIN AUTHPROVIDER ###');
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      await _firebaseAuth!
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint('### ERROR METODO REGISTER AUTHPROVIDER $e ###');
      return false;
    }
  }

  User? getUser() {
    final User? currentUser = _firebaseAuth!.currentUser;
    return currentUser;
  }

  Future<List<void>> signOut() async {
    return Future.wait(_firebaseAuth!.signOut() as Iterable<Future<void>>);
  }
}
