// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final List<Datum>? data;

  Categories({
    this.data,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? name;
  // final DateTime? createdAt;
  // final DateTime? updatedAt;
  // final int? v;

  Datum({
    this.id,
    this.name,
    // this.createdAt,
    // this.updatedAt,
    // this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        // createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        // updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        // "createdAt": createdAt?.toIso8601String(),
        // "updatedAt": updatedAt?.toIso8601String(),
        // "__v": v,
      };
}
