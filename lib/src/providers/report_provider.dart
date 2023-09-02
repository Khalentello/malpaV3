import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:malpav3/src/models/reports.dart';

import 'package:malpav3/src/providers/auth_provider.dart';

class ReportProvider {
  CollectionReference? _collectionReference;
  List<String> imageUrl = [];
  FirebaseStorage? _firebaseReport;
  BuildContext? context;
  AuthProvider? _authProvider;
  ReportProvider() {
    _collectionReference = FirebaseFirestore.instance.collection("Reports");
    _firebaseReport = FirebaseStorage.instance;
    _authProvider = AuthProvider();
  }

  Future<List> uploadImages(List images, String reportNum) async {
    imageUrl = [];
    final String? userId = await _authProvider!.getUser()!.uid;
    if (images.isNotEmpty) {
      //ruta donde se guardaran las imágenes
      Reference referenceImages = _firebaseReport!
          .ref()
          .child("Reportes/Id:${userId}/Reporte:${reportNum}");
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
    debugPrint('##El numero de reporte:$reportNum');
    return imageUrl;
  }

  Future<void> createReport(NewReport report) async {
    try {
      return await _collectionReference!
          .doc(report.userId)
          .set(report.toJson());
    } catch (e) {
      debugPrint('### ERROR EN Create Report  ###');
    }
  }
}
