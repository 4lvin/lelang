// To parse this JSON data, do
//
//     final getRegisterModel = getRegisterModelFromJson(jsonString);

import 'dart:convert';

class GetRegisterModel {
  GetRegisterModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory GetRegisterModel.fromRawJson(String str) => GetRegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetRegisterModel.fromJson(Map<String, dynamic> json) => GetRegisterModel(
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
    this.nama,
    this.email,
    this.telpon,
  });

  int kdUser;
  String nama;
  String email;
  String telpon;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    kdUser: json["kd_user"],
    nama: json["nama"],
    email: json["email"],
    telpon: json["telpon"],
  );

  Map<String, dynamic> toJson() => {
    "kd_user": kdUser,
    "nama": nama,
    "email": email,
    "telpon": telpon,
  };
}
