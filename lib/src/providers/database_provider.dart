import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DatabaseProvider {
  List<String> imageUrl = [];
  FirebaseStorage? _firebaseStorage;

  DatabaseProvider() {
    _firebaseStorage = FirebaseStorage.instance;
  }

  FirebaseAuth? _firebaseAuth;
  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<void> uploadReport(List images) async {
    if (images.isNotEmpty) {
      //Nombre único para el reporte
      String reportIdentifier =
          DateTime.now().millisecondsSinceEpoch.toString();
      debugPrint('##${reportIdentifier}');
      //ruta donde se guardaran las imágenes
      Reference referenceImages = _firebaseStorage!.ref().child(
          "Reportes/user:${_firebaseAuth!.currentUser!.uid.toString()}/Reporte:${reportIdentifier}");
      //ciclo para subir cada imagen
      for (var i = 0; i < images.length; i++) {
        //Ruta con el nombre de la imagen
        Reference referenceImageToUpload =
            referenceImages.child('${images[i]?.name}');
        try {
          //guardar imagen
          await referenceImageToUpload.putFile(
            File(images[i]!.path),
          );
          //Tomar el url donde se guarda la imagen
          imageUrl.add(await referenceImageToUpload.getDownloadURL());
          debugPrint('###${imageUrl}');
        } catch (e) {
          debugPrint('##Algo salio mal');
        }
      }
    }
  }
}
