import 'dart:convert';

class Login {
  bool? status;
  int? otp;
  bool? firstTime;
  String? msg;

  Login({
    this.status,
    this.otp,
    this.firstTime,
    this.msg,
  });

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        status: json["status"],
        otp: json["otp"],
        firstTime: json["firstTime"],
        msg: json["msg"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "otp": otp,
        "firstTime": firstTime,
        "msg": msg,
      };
}
