// To parse this JSON data, do
//
//     final getMessages = getMessagesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMessages getMessagesFromJson(String str) => GetMessages.fromJson(json.decode(str));

String getMessagesToJson(GetMessages data) => json.encode(data.toJson());

class GetMessages {
  GetMessages({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory GetMessages.fromJson(Map<String, dynamic> json) => GetMessages(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
