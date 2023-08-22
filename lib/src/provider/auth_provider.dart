import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;
  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<String> login(String email, String password) async {
    String res = "Ha ocurrido un error";
    try {
      await _firebaseAuth!
          .signInWithEmailAndPassword(email: email, password: password);
      res = "Inicio Correcto";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'wrong-password' || err.code == "user-not-found") {
        res = "Datos incorrectos, intenta nuevamente";
      } else if (err.code == "too-many-requests") {
        res = "Varios intentos fallidos, Intenta mas tarde";
      } else if (err.code == "invalid-email") {
        res = "Correo incorrecto";
      } else {
        res = err.toString();
      }
    } catch (e) {
      res = "Ha ocurrido un error, revisa tus datos e intenta nuevamente";
      debugPrint(e.toString());
    }
    debugPrint(res);
    return res;
  }

  Future<String> register(String email, String password) async {
    String res = "Ha ocurrido un error";
    try {
      await _firebaseAuth!
          .createUserWithEmailAndPassword(email: email, password: password);

      return "Usuario creado";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        res = 'Ya existe una cuenta con ese correo';
      } else if (e.code == 'invalid-email') {
        res = 'Revisa el correo ingresado';
      } else if (e.code == 'weak-password') {
        res = "Contraseña debe tener mínimo 6 caracteres";
      } else {
        res = e.toString();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  User? getUser() {
    return _firebaseAuth!.currentUser;
  }

  //Sign out
  Future<void> signOut() async {
    await _firebaseAuth?.signOut();
  }
}
