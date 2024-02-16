import 'dart:convert';

class Verify {
  String? userId;
  String? phone;
  String? userType;
  UserData? userData;
  String? token;

  Verify({
    this.userId,
    this.phone,
    this.userType,
    this.userData,
    this.token,
  });

  factory Verify.fromJson(String str) => Verify.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Verify.fromMap(Map<String, dynamic> json) => Verify(
        userId: json["userId"],
        phone: json["phone"],
        userType: json["userType"],
        userData: json["userData"] == null ? null : UserData.fromMap(json["userData"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "phone": phone,
        "userType": userType,
        "userData": userData?.toMap(),
        "token": token,
      };
}

class UserData {
 // String? createdAt;
  String? id;
  String? phone;
  String? userType;
  String? name;
  String? email;
  String? profileImage;
  String? location;
  String? currentPay;
  String? expectationPay;
  //String?
  dynamic skills;
  String? experience;
  String? resume;
  String? companyName;
  String? aboutCompany;
//  DateTime? updatedAt;
    String? videoUrl;
    String? alternativePhone;
    String? dob;
    String? gender;
 String? letter;
  UserData({
  //  this.createdAt,
    this.id,
    this.phone,
    this.userType,
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
    //this.updatedAt,
      this.videoUrl,
    this.alternativePhone,
    this.dob,
    this.gender,
    this.letter,
  });

  UserData copyWith({
   // String? createdAt,
    String? id,
    String? phone,
    String? userType,
  //  dynamic otp,
    String? name,
    String? email,
    String? profileImage,
    String? location,
    String? currentPay,
    String? expectationPay,
    List<String>? skills,
    String? experience,
    String? resume,
    String? companyName,
    String? aboutCompany,
  //  int? v,
  //  DateTime? updatedAt,
    String? videoUrl,
    String? alternativePhone,
    String? dob,
    String? gender,
    String? letter,
  }) =>
      UserData(
     //   createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        phone: phone ?? this.phone,
        userType: userType ?? this.userType,
     //   otp: otp ?? this.otp,
        name: name ?? this.name,
        email: email ?? this.email,
        profileImage: profileImage ?? this.profileImage,
        location: location ?? this.location,
        currentPay: currentPay ?? this.currentPay,
        expectationPay: expectationPay ?? this.expectationPay,
        skills: skills ?? this.skills,
        experience: experience ?? this.experience,
        resume: resume ?? this.resume,
        companyName: companyName ?? this.companyName,
        aboutCompany: aboutCompany ?? this.aboutCompany,
      //  v: v ?? this.v,
      //  updatedAt: updatedAt ?? this.updatedAt,
        videoUrl: videoUrl ?? this.videoUrl,
        alternativePhone: alternativePhone ?? this.alternativePhone,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        letter: letter ?? this.letter,
      );


  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
     //   createdAt: json["createdAt"],
        id: json["_id"],
        phone: json["phone"],
        userType: json["userType"],
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
    //    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
            videoUrl: json["videoUrl"],
        alternativePhone: json["alternativePhone"],
        dob: json["dob"],
        gender: json["gender"],
        letter: json["letter"],
      );

  Map<String, dynamic> toMap() => {
      //  "createdAt": createdAt,
        "_id": id,
        "phone": phone,
        "userType": userType,
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
      //  "updatedAt": updatedAt?.toIso8601String(),
        "alternativePhone": alternativePhone,
        "dob": dob,
        "gender": gender,
        "letter": letter,
      };
}
