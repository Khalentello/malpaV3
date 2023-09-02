// To parse this JSON data, do
//
//     final NewReport = userAppFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

NewReport NewReportFromJson(String str) => NewReport.fromJson(json.decode(str));

String NewReportToJson(NewReport data) => json.encode(data.toJson());

class NewReport {
  String reportId;
  String userId;
  String vehiclePlate;
  DateTime dateTimeReport;

  GeoPoint location;
  List<dynamic> imagesUrl;

  NewReport({
    required this.reportId,
    required this.userId,
    required this.vehiclePlate,
    required this.dateTimeReport,
    required this.location,
    required this.imagesUrl,
  });

  factory NewReport.fromJson(Map<String, dynamic> json) => NewReport(
        reportId: json["reportId"],
        userId: json["user"],
        vehiclePlate: json["vehiclePlate"],
        dateTimeReport: json['dateTimeReport'],
        location: json['location'],
        imagesUrl: json['images'],
      );

  Map<String, dynamic> toJson() => {
        "reportId": reportId,
        "userId": userId,
        "vehiclePlate": vehiclePlate,
        "dateTimeReport": dateTimeReport,
        "location": location,
        "images": imagesUrl,
      };
}
