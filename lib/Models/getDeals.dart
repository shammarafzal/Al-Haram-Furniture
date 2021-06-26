// To parse this JSON data, do
//
//     final getDeals = getDealsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetDeals getDealsFromJson(String str) => GetDeals.fromJson(json.decode(str));

String getDealsToJson(GetDeals data) => json.encode(data.toJson());

class GetDeals {
  GetDeals({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory GetDeals.fromJson(Map<String, dynamic> json) => GetDeals(
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
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
