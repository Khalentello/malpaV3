// To parse this JSON data, do
//
//     final userApp = userAppFromJson(jsonString);

import 'dart:convert';

UserApp userAppFromJson(String str) => UserApp.fromJson(json.decode(str));

String userAppToJson(UserApp data) => json.encode(data.toJson());

class UserApp {
  String id;
  String user;
  String phone;
  String email;
  String password;

  UserApp({
    required this.id,
    required this.user,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory UserApp.fromJson(Map<String, dynamic> json) => UserApp(
        id: json["id"],
        user: json["user"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
