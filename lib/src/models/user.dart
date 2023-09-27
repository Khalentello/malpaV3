// To parse this JSON data, do
//
//     final userApp = userAppFromJson(jsonString);

import 'dart:convert';

UserApp userAppFromJson(String str) => UserApp.fromJson(json.decode(str));

String userAppToJson(UserApp data) => json.encode(data.toJson());

class UserApp {
  String id;
  String name;
  String lastName;
  String country;
  String phone;
  String email;
  String password;

  UserApp({
    required this.id,
    required this.name,
    required this.lastName,
    required this.country,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory UserApp.fromJson(Map<String, dynamic> json) => UserApp(
        id: json["id"],
        name: json["name"],
        lastName: json["last name"],
        country: json["country"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last name": lastName,
        "country": country,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
