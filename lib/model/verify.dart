import 'dart:convert';

class Verify {
  bool? status;
  String? userId;
  String? phone;
  String? userType;
  UserData? userData;
  String? token;
  String? msg;

  Verify({
    this.status,
    this.userId,
    this.phone,
    this.userType,
    this.userData,
    this.token,
    this.msg,
  });

  factory Verify.fromJson(String str) => Verify.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Verify.fromMap(Map<String, dynamic> json) => Verify(
        status: json["status"],
        userId: json["userId"],
        phone: json["phone"],
        userType: json["userType"],
        userData: json["userData"] == null ? null : UserData.fromMap(json["userData"]),
        token: json["token"],
        msg: json["msg"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "userId": userId,
        "phone": phone,
        "userType": userType,
        "userData": userData?.toMap(),
        "token": token,
        "msg": msg,
      };
}

class UserData {
  String? createdAt;
  String? id;
  String? phone;
  String? userType;
  dynamic otp;
  String? name;
  String? email;
  String? profileImage;
  String? location;
  String? currentPay;
  String? expectationPay;
  String? skills;
  String? experience;
  String? resume;
  String? companyName;
  String? aboutCompany;
  int? v;
  DateTime? updatedAt;

  UserData({
    this.createdAt,
    this.id,
    this.phone,
    this.userType,
    this.otp,
    this.name,
    this.email,
    this.profileImage,
    this.location,
    this.currentPay,
    this.expectationPay,
    this.skills,
    this.experience,
    this.resume,
    this.companyName,
    this.aboutCompany,
    this.v,
    this.updatedAt,
  });

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        createdAt: json["createdAt"],
        id: json["_id"],
        phone: json["phone"],
        userType: json["userType"],
        otp: json["otp"],
        name: json["name"],
        email: json["email"],
        profileImage: json["profileImage"],
        location: json["location"],
        currentPay: json["currentPay"],
        expectationPay: json["expectationPay"],
        skills: json["skills"],
        experience: json["experience"],
        resume: json["resume"],
        companyName: json["companyName"],
        aboutCompany: json["aboutCompany"],
        v: json["__v"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt,
        "_id": id,
        "phone": phone,
        "userType": userType,
        "otp": otp,
        "name": name,
        "email": email,
        "profileImage": profileImage,
        "location": location,
        "currentPay": currentPay,
        "expectationPay": expectationPay,
        "skills": skills,
        "experience": experience,
        "resume": resume,
        "companyName": companyName,
        "aboutCompany": aboutCompany,
        "__v": v,
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
