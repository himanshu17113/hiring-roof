class ContactModel {
  final bool status;
  final String msg;
  final Data data;

  ContactModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      status: json['status'],
      msg: json['msg'],
      data: Data.fromJson(json['data']),
    );
  }

  ContactModel copyWith({
    bool? status,
    String? msg,
    Data? data,
  }) =>
      ContactModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );
}

class Data {
  final String name;
  final String email;
  final String message;
  final String createdAt;
  final String id;
  final DateTime updatedAt;
  final int v;

  Data({
    required this.name,
    required this.email,
    required this.message,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      email: json['email'],
      message: json['message'],
      createdAt: json['createdAt'],
      id: json['id'],
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['v'],
    );
  }

  Data copyWith({
    String? name,
    String? email,
    String? message,
    String? createdAt,
    String? id,
    DateTime? updatedAt,
    int? v,
  }) =>
      Data(
        name: name ?? this.name,
        email: email ?? this.email,
        message: message ?? this.message,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );
}
