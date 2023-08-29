// ignore_for_file: unused_field

import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart' as location;

class ReportEventController {
  BuildContext? context;
  Function? refresh;
  final TextEditingController placaCapture = TextEditingController();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(4.5882045, -74.1236818), zoom: 5);
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  Position? _position;
  StreamSubscription<Position>? _positionStream;
  final LocationSettings _locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.best, distanceFilter: 1);
  String imageUrl = "";
  Reference? referenceImageToUpload;
  List<XFile?> arrayImages = [];
  List<String?> arrayImagesPath = [];
  void init(BuildContext context, Function refresh) {
    WidgetsFlutterBinding.ensureInitialized();
    this.context = context;
    this.refresh = refresh;
    checkGps();
  }

  // ------ METODO CONTROLADOR DEL GOOGLE MAPS
  void onMapCreate(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  // ------ METODO PARA DETERMINAR LA POSICION
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Probar si los servicios de ubicación están habilitados.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, no continúe
      // acceder a la posición y solicitar a los usuarios de la
      // App para habilitar los servicios de localización.
      return Future.error(
        '#### LOS SERVICIOS DE UBICACIÓN ESTÁN DESHABILITADOS.',
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados, la próxima vez podría intentarlo
        // solicitando permisos de nuevo (aquí también es donde
        // Android's shouldShowRequestPermissionRationale
        // devolvió verdadero. De acuerdo con las pautas de Android
        // su aplicación debería mostrar una interfaz de usuario explicativa ahora.
        return Future.error(
          '#### LOS PERMISOS DE UBICACIÓN ESTÁN DENEGADOS PERMANENTEMENTE, NO PODEMOS SOLICITAR PERMISOS',
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Cuando llegamos aquí, se otorgan los permisos y podemos
      // continuamos accediendo a la posición del dispositivo.
      return Future.error('');
    }
    return await Geolocator.getCurrentPosition();
  }

  // ---- MÉTODO PARA LA ANIMACIÓN DE LA CÁMARA Y UBICAR EN POSICIÓN DEL CONDUCTOR/CLIENTE
  Future<void> animateCameraToPosition(
    double latitude,
    double longitude,
  ) async {
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(latitude, longitude),
          zoom: 17,
        ),
      ),
    );
  }

  // ---- MÉTODO PARA CENTRAR LA POSICIÓN EN EL MAPA
  Future<void> centerPosition() async {
    if (_position != null) {
      await animateCameraToPosition(
        _position!.latitude,
        _position!.longitude,
      );
      debugPrint('#### EJECUTANDO centerPosition()\n'
          'LATLNG ${_position!.latitude} - ${_position!.longitude}');
    } else {
      debugPrint('#### EL GPS NO ESTÁ ACTIVADO');
    }
  }

  // ---- MÉTODO PARA MANTENER ACTUALIZADA LA POSICIÓN DEL CONDUCTOR/CLIENTE
  Future<void> updateLocation() async {
    try {
      await _determinePosition();
      _position = await Geolocator.getLastKnownPosition();
      centerPosition();
    } catch (e) {
      debugPrint('#### ERROR EN EL MÉTODO PARA updateLocation() ');
    }
  }

  // ---- MÉTODO PARA VALIDAR SI ESTÁ FUNCIONADO EL GPS Y LLAMAS O DESENCADENAR LOS MÉTODOS ANTERIORES CREADOS.
  Future<void> checkGps() async {
    bool isLocationEnable = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnable) {
      updateLocation();
    } else {
      bool locationGps = await location.Location().requestService();
      if (locationGps) {
        updateLocation();
      }
    }
  }

  Future<void> uploadPicture() async {
    //Take a picture
    arrayImages.removeWhere((element) => [null, "", false].contains(element));
    if (arrayImages.length <= 4) {
      ImagePicker imagePicker = await ImagePicker();
      arrayImages.add(
        await imagePicker.pickImage(
          source: ImageSource.camera,
        ),
      );
    } else {
      debugPrint('Máximo imágenes');
      showDialog<String>(
        context: this.context!,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Máximo de fotos tomadas'),
          content: const Text('Solo se admiten 5 fotos por reporte'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Entendido'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.pop(context),
                arrayImages = [],
              },
              child: const Text('Borrar todas las fotos'),
            ),
          ],
        ),
      );
    }
    print('###${arrayImages.length}');
    print('###${arrayImages}');

    if (arrayImages.isNotEmpty) {
      // Reference referenceImages = FirebaseStorage.instance.ref().child(
      // "Reportes/${FirebaseAuth.instance.currentUser!.uid.toString()}");

      //Como se va a llamar el archivo al momento de subirlo

      //Por nombre
      // Reference referenceImageToUpload = referenceImages.child('${file?.name}');

      //Por identificador único según la fecha
      // String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
      // Reference referenceImageToUpload = referenceImages.child(uniqueName);
      // try {
      //   //guardar imagen
      //   await referenceImageToUpload.putFile(File(file.path));
      //   imageUrl = await referenceImageToUpload.getDownloadURL();
      // } catch (e) {}
    }
  }

  Future<void> uploadReport() async {
    // debugPrint("###${arrayImages[0]?.path}");
    print('###${arrayImages.length}');
  }
}
