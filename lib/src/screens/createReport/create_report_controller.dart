import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:malpav3/src/utils/utils.dart';

class CreateReportController {
  // ATRIBUTOS
  BuildContext? context;
  Function? refresh;
  Position? _position;
  // ignore: unused_field
  StreamSubscription<Position>? _positionStream;
  final TextEditingController placaCapture = TextEditingController();

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(4.650992320303, -74.1248141),
    zoom: 12,
  );
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  final LocationSettings _locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.best,
    distanceFilter: 1,
  );
  // CONSTRUCTOR
  void init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
    checkGps();
  }

  // MÉTODOS

  // ------ MÉTODO CONTROLADOR DEL GOOGLE MAPS
  // void onMapCreate(GoogleMapController controller) {
  //   controller.setMapStyle(StylesGoogleMaps.mapsStyles);
  //   _mapController.complete(controller);
  // }

  //Determinar posición
  Future<Position> _determinatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    //los servicios de ubicación están habilitados?
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

  // ---- MÉTODO PARA LA ANIMACIÓN DE LA CÁMARA Y UBICAR EN POSICIÓN DEL CONDUCTOR
  Future<void> animateCameraToPosition(
    double latitude,
    double longitude,
  ) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
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
      animateCameraToPosition(
        _position!.latitude,
        _position!.longitude,
      );
    } else {
      debugPrint('#### EL GPS NO ESTÁ ACTIVADO');
      showSnackBar(
          'Debes activar el GPS para obtener tu posición,\n'
          'de lo contrario no podemos continuar con el servicio.',
          context!);
    }
  }

  // ---- MÉTODO PARA MANTENER ACTUALIZADA LA POSICIÓN
  Future<void> updateLocation() async {
    try {
      await _determinatePosition();
      _position = await Geolocator.getLastKnownPosition();
      centerPosition();
      _positionStream =
          Geolocator.getPositionStream(locationSettings: _locationSettings)
              .listen((Position position) {
        _position = position;
        animateCameraToPosition(
          _position!.latitude,
          _position!.longitude,
        );
      });
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
}
