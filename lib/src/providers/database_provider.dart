import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:malpav3/src/models/user.dart';
import 'package:malpav3/src/providers/user_provider.dart';
import 'package:malpav3/src/providers/auth_provider.dart';

class DatabaseProvider {
  List<String> imageUrl = [];
  String reportIdentifier = "";
  FirebaseStorage? _firebaseStorage;
  BuildContext? context;
  AuthProvider? _authProvider;
  UserProvider? _userProvider;
  DatabaseProvider() {
    _firebaseStorage = FirebaseStorage.instance;
    _authProvider = AuthProvider();
    _userProvider = UserProvider();
  }

  Future<String> uploadReport(List images) async {
    imageUrl = [];
    final UserApp? userId =
        await _userProvider!.getByIdUserApp(_authProvider!.getUser()!.uid);
    if (images.isNotEmpty) {
      //Nombre único para el reporte
      reportIdentifier = DateTime.now().millisecondsSinceEpoch.toString();
      debugPrint('##${reportIdentifier}');
      //ruta donde se guardaran las imágenes
      Reference referenceImages = _firebaseStorage!
          .ref()
          .child("Reportes/Id:${userId?.id}/Reporte:${reportIdentifier}");
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
          debugPrint('###URl de la imagen:${imageUrl}');
        } catch (e) {
          debugPrint('##Algo salio mal');
        }
      }
    }
    debugPrint('##El numero de reporte:$reportIdentifier');
    return reportIdentifier;
  }
}
