import 'dart:convert';

class Saved {
  bool? status;
  String? msg;
  List<Data>? data;

  Saved({
    this.status,
    this.msg,
    this.data,
  });

  factory Saved.fromJson(String str) => Saved.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Saved.fromMap(Map<String, dynamic> json) => Saved(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Data {
  String? id;
  AppliId? applicantId;
  AppliId? applierId;
  dynamic jobId;
  bool? shortlist;
  bool? interviews;
  bool? interviews2;
  bool? selectedCandidates;
  String? interviewsTime;
  String? interviews2Time;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? interviewsDate;
  String? interviews2Date;

  Data({
    this.id,
    this.applicantId,
    this.applierId,
    this.jobId,
    this.shortlist,
    this.interviews,
    this.interviews2,
    this.selectedCandidates,
    this.interviewsTime,
    this.interviews2Time,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.interviewsDate,
    this.interviews2Date,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["_id"],
        applicantId: json["applicantId"] == null ? null : AppliId.fromMap(json["applicantId"]),
        applierId: json["applierId"] == null ? null : AppliId.fromMap(json["applierId"]),
        jobId: json["jobId"],
        shortlist: json["shortlist"],
        interviews: json["interviews"],
        interviews2: json["interviews2"],
        selectedCandidates: json["selectedCandidates"],
        interviewsTime: json["interviewsTime"],
        interviews2Time: json["interviews2Time"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        interviewsDate: json["interviewsDate"],
        interviews2Date: json["interviews2Date"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "applicantId": applicantId?.toMap(),
        "applierId": applierId?.toMap(),
        "jobId": jobId,
        "shortlist": shortlist,
        "interviews": interviews,
        "interviews2": interviews2,
        "selectedCandidates": selectedCandidates,
        "interviewsTime": interviewsTime,
        "interviews2Time": interviews2Time,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "interviewsDate": interviewsDate,
        "interviews2Date": interviews2Date,
      };
}

class AppliId {
  String? id;
  String? userType;
  String? name;
  String? profileImage;

  AppliId({
    this.id,
    this.userType,
    this.name,
    this.profileImage,
  });

  factory AppliId.fromJson(String str) => AppliId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppliId.fromMap(Map<String, dynamic> json) => AppliId(
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
