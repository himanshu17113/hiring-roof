// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

Notifications notificationFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  final String? senderId;
  final String? receiverId;
  final String? title;
  final String? desc;
  final Extra? extra;

  Notifications({
    this.senderId,
    this.receiverId,
    this.title,
    this.desc,
    this.extra,
  });

  Notifications copyWith({
    String? senderId,
    String? receiverId,
    String? title,
    String? desc,
    Extra? extra,
  }) =>
      Notifications(
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        extra: extra ?? this.extra,
      );

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        senderId: json["senderId"],
        receiverId: json["receiverId"],
        title: json["title"],
        desc: json["desc"],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "receiverId": receiverId,
        "title": title,
        "desc": desc,
        "extra": extra?.toJson(),
      };
}

class Extra {
  final String? companyLogo;

  Extra({
    this.companyLogo,
  });

  Extra copyWith({
    String? companyLogo,
  }) =>
      Extra(
        companyLogo: companyLogo ?? this.companyLogo,
      );

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        companyLogo: json["companyLogo"],
      );

  Map<String, dynamic> toJson() => {
        "companyLogo": companyLogo,
      };
}
