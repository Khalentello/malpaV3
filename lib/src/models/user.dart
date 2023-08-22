// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String nombre;
  String correo;
  String telefono;
  String contrasena;

  UserModel({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.contrasena,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nombre: json["nombre"],
    correo: json["correo"],
    telefono: json["telefono"],
    contrasena: json["contrasena"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "correo": correo,
    "telefono": telefono,
    "contrasena": contrasena,
  };
}
