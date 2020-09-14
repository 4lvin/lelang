// To parse this JSON data, do
//
//     final getCheckOtpModel = getCheckOtpModelFromJson(jsonString);

import 'dart:convert';

class GetCheckOtpModel {
  GetCheckOtpModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory GetCheckOtpModel.fromRawJson(String str) => GetCheckOtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCheckOtpModel.fromJson(Map<String, dynamic> json) => GetCheckOtpModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.kdUser,
    this.email,
  });

  String kdUser;
  String email;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    kdUser: json["kd_user"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "kd_user": kdUser,
    "email": email,
  };
}
