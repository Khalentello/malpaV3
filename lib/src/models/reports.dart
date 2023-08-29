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
  String urlImageList;

  UserApp({
    required this.reportId,
    required this.userId,
    required this.vehiclePlate,
    this.urlImageList = '',
  });

  factory UserApp.fromJson(Map<String, dynamic> json) => UserApp(
        reportId: json["reportId"],
        userId: json["user"],
        vehiclePlate: json["vehiclePlate"],
      );

  Map<String, dynamic> toJson() => {
        "reportId": reportId,
        "userId": userId,
        "vehiclePlate": vehiclePlate,
      };
}
