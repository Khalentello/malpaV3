// To parse this JSON data, do
//
//     final NewReport = userAppFromJson(jsonString);

import 'dart:convert';

NewReport NewReportFromJson(String str) => NewReport.fromJson(json.decode(str));

String NewReportToJson(NewReport data) => json.encode(data.toJson());

class NewReport {
  String reportId;
  String userId;
  String vehiclePlate;
  double latitude;
  double longitude;
  List<dynamic> imagesUrl;

  NewReport({
    required this.reportId,
    required this.userId,
    required this.vehiclePlate,
    required this.imagesUrl,
    required this.latitude,
    required this.longitude,
  });

  factory NewReport.fromJson(Map<String, dynamic> json) => NewReport(
        reportId: json["reportId"],
        userId: json["user"],
        vehiclePlate: json["vehiclePlate"],
        imagesUrl: json['images'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        "reportId": reportId,
        "userId": userId,
        "vehiclePlate": vehiclePlate,
        "images": imagesUrl,
        "latitude": latitude,
        "longitude": longitude,
      };
}
