import 'dart:convert';

class JobModal {
  bool? status;
  String? msg;
  int? jobCount;
  int? pageCount;
  int? currentPage;
  List<Job>? jobs;

  JobModal({
    this.status,
    this.msg,
    this.jobCount,
    this.pageCount,
    this.currentPage,
    this.jobs,
  });

  factory JobModal.fromRawJson(String str) => JobModal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobModal.fromJson(Map<String, dynamic> json) => JobModal(
        status: json["status"],
        msg: json["msg"],
        jobCount: json["jobCount"],
        pageCount: json["pageCount"],
        currentPage: json["currentPage"],
        jobs: json["jobs"] == null ? [] : List<Job>.from(json["jobs"]!.map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "jobCount": jobCount,
        "pageCount": pageCount,
        "currentPage": currentPage,
        "jobs": jobs == null ? [] : List<dynamic>.from(jobs!.map((x) => x.toJson())),
      };
}

class Job {
  String? id;
  UserId? userId;
  String? jobTittle;
  String? skills;
  String? jobType;
  String? workType;
  String? availability;
  String? timePeriod;
  String? note;
  int? pay;
  String? payType;
  String? location;
  String? companyName;
  String? companyLogo;
  bool? isSaved;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool applied;

  Job({
    this.id,
    this.userId,
    this.jobTittle,
    this.skills,
    this.jobType,
    this.workType,
    this.availability,
    this.timePeriod,
    this.note,
    this.pay,
    this.payType,
    this.location,
    this.companyName,
    this.companyLogo,
    this.isSaved,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.applied = false
  });

  factory Job.fromRawJson(String str) => Job.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        jobTittle: json["jobTittle"],
        skills: json["skills"],
        jobType: json["jobType"],
        workType: json["workType"],
        availability: json["availability"],
        timePeriod: json["timePeriod"],
        note: json["note"],
        pay: json["pay"],
        payType: json["payType"],
        location: json["location"],
        companyName: json["companyName"],
        companyLogo: json["companyLogo"],
        isSaved: json["isSaved"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "jobTittle": jobTittle,
        "skills": skills,
        "jobType": jobType,
        "workType": workType,
        "availability": availability,
        "timePeriod": timePeriod,
        "note": note,
        "pay": pay,
        "payType": payType,
        "location": location,
        "companyName": companyName,
        "companyLogo": companyLogo,
        "isSaved": isSaved,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

   
}

class UserId {
  String? id;
  String? phone;
  String? userType;
  String? name;
  String? email;
  String? profileImage;

  UserId({
    this.id,
    this.phone,
    this.userType,
    this.name,
    this.email,
    this.profileImage,
  });

  factory UserId.fromRawJson(String str) => UserId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        phone: json["phone"],
        userType: json["userType"],
        name: json["name"],
        email: json["email"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "userType": userType,
        "name": name,
        "email": email,
        "profileImage": profileImage,
      };
}
