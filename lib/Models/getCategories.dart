// To parse this JSON data, do
//
//     final getCategories = getCategoriesFromJson(jsonString);

import 'dart:convert';

GetCategories getCategoriesFromJson(String str) => GetCategories.fromJson(json.decode(str));

String getCategoriesToJson(GetCategories data) => json.encode(data.toJson());

class GetCategories {
  GetCategories({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory GetCategories.fromJson(Map<String, dynamic> json) => GetCategories(
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
    required this.categoryName,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String categoryName;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryName: json["category_name"],
    icon: json["icon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "icon": icon,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
