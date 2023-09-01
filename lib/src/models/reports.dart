// To parse this JSON data, do
//
//     final userApp = userAppFromJson(jsonString);

import 'dart:convert';

UserApp userAppFromJson(String str) => UserApp.fromJson(json.decode(str));

String userAppToJson(UserApp data) => json.encode(data.toJson());

class UserApp {
  String reportId;
  String userId;
  String vehiclePlate;
  List<String> imagesUrl;

  UserApp({
    required this.reportId,
    required this.userId,
    required this.vehiclePlate,
    required this.imagesUrl,
  });

  factory UserApp.fromJson(Map<String, dynamic> json) => UserApp(
      reportId: json["reportId"],
      userId: json["user"],
      vehiclePlate: json["vehiclePlate"],
      imagesUrl: json['images']);

  Map<String, dynamic> toJson() => {
        "reportId": reportId,
        "userId": userId,
        "vehiclePlate": vehiclePlate,
        "images": imagesUrl,
      };
}
