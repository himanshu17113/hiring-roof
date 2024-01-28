import 'dart:convert';

import 'package:hiring_roof/model/job.dart';

class ApplicationModal {
  bool? status;
  String? msg;
  int? count;
  int? pageCount;
  int? currentPage;
  List<Application>? data;

  ApplicationModal({
    this.status,
    this.msg,
    this.count,
    this.pageCount,
    this.currentPage,
    this.data,
  });

  factory ApplicationModal.fromJson(String str) => ApplicationModal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApplicationModal.fromMap(Map<String, dynamic> json) => ApplicationModal(
        status: json["status"],
        msg: json["msg"],
        count: json["count"],
        pageCount: json["pageCount"],
        currentPage: json["currentPage"],
        data: json["data"] == null ? [] : List<Application>.from(json["data"]!.map((x) => Application.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "count": count,
        "pageCount": pageCount,
        "currentPage": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Application {
  final String? id;
  final ApplicantId? applicantId;
  final ApplierId? applierId;
  final Job? jobId;
  bool? shortlist;
  bool? interviews;
  bool? interviews2;
  bool? selectedCandidates;
  String? interviewsDate;
  String? interviewsTime;
  String? interviews2Date;
  String? interviews2Time;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool? rejected;
  bool shortlistsubmit;
  bool interveiwlistsubmit;

  bool interveiwselect;

  Application(
      {this.id,
      this.applicantId,
      this.applierId,
      this.jobId,
      this.shortlist,
      this.interviews,
      this.interviews2,
      this.selectedCandidates,
      this.interviewsDate,
      this.interviewsTime,
      this.interviews2Date,
      this.interviews2Time,
      this.createdAt,
      this.updatedAt,
      this.shortlistsubmit = false,
      this.interveiwlistsubmit = false,
      this.rejected ,// = false,
      this.interveiwselect = false});

  factory Application.fromJson(String str) => Application.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Application.fromMap(Map<String, dynamic> json) => Application(
        id: json["_id"],
        applicantId: json["applicantId"] == null ? null : ApplicantId.fromMap(json["applicantId"]),
        applierId: json["applierId"] == null ? null : ApplierId.fromMap(json["applierId"]),
        jobId: json["jobId"] == null ? null : Job.fromJsonbyappli(json["jobId"]),
        shortlist: json["shortlist"],
        interviews: json["interviews"],
        interviews2: json["interviews2"],
        selectedCandidates: json["selectedCandidates"],
        interviewsDate: json["interviewsDate"],
        interviewsTime: json["interviewsTime"],
        interviews2Date: json["interviews2Date"],
        interviews2Time: json["interviews2Time"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "applicantId": applicantId?.toMap(),
        "applierId": applierId?.toMap(),
        "jobId": jobId?.toJson(),
        "shortlist": shortlist,
        "interviews": interviews,
        "interviews2": interviews2,
        "selectedCandidates": selectedCandidates,
        "interviewsDate": interviewsDate,
        "interviewsTime": interviewsTime,
        "interviews2Date": interviews2Date,
        "interviews2Time": interviews2Time,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class ApplicantId {
  final String? id;
  final String? userType;
  final int? otp;
  final String? name;
  final String? profileImage;
  final String? location;
  final String? currentPay;
  final String? expectationPay;
  final String? skills;
  final String? experience;
  // String? companyName;
  // String? aboutCompany;
  // int? v;
  final DateTime? updatedAt;

  ApplicantId({
    this.id,
    this.userType,
    this.otp,
    this.name,
    this.profileImage,
    this.location,
    this.currentPay,
    this.expectationPay,
    this.skills,
    this.experience,
    // this.companyName,
    // this.aboutCompany,
    // this.v,
    this.updatedAt,
  });

  factory ApplicantId.fromJson(String str) => ApplicantId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApplicantId.fromMap(Map<String, dynamic> json) => ApplicantId(
        id: json["_id"],
        userType: json["userType"],
        otp: json["otp"],
        name: json["name"],
        profileImage: json["profileImage"],
        location: json["location"],
        currentPay: json["currentPay"],
        expectationPay: json["expectationPay"],
        skills: json["skills"],
        experience: json["experience"],
        // companyName: json["companyName"],
        // aboutCompany: json["aboutCompany"],
        // v: json["__v"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userType": userType,
        "otp": otp,
        "name": name,
        "profileImage": profileImage,
        "location": location,
        "currentPay": currentPay,
        "expectationPay": expectationPay,
        "skills": skills,
        "experience": experience,
        // "companyName": companyName,
        // "aboutCompany": aboutCompany,
        // "__v": v,
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class ApplierId {
  final String? id;
  final String? userType;
  final String? name;
  final String? profileImage;

  ApplierId({
    this.id,
    this.userType,
    this.name,
    this.profileImage,
  });

  factory ApplierId.fromJson(String str) => ApplierId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApplierId.fromMap(Map<String, dynamic> json) => ApplierId(
        id: json["_id"],
        userType: json["userType"],
        name: json["name"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userType": userType,
        "name": name,
        "profileImage": profileImage,
      };
}
