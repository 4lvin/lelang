// To parse this JSON data, do
//
//     final getLoginModel = getLoginModelFromJson(jsonString);

import 'dart:convert';

class GetLoginModel {
  GetLoginModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory GetLoginModel.fromRawJson(String str) => GetLoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetLoginModel.fromJson(Map<String, dynamic> json) => GetLoginModel(
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
    this.idToken,
    this.kdUser,
    this.email,
    this.nama,
    this.telpon,
  });

  String idToken;
  String kdUser;
  String email;
  String nama;
  String telpon;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idToken: json["id_token"],
    kdUser: json["kd_user"],
    email: json["email"],
    nama: json["nama"],
    telpon: json["telpon"],
  );

  Map<String, dynamic> toJson() => {
    "id_token": idToken,
    "kd_user": kdUser,
    "email": email,
    "nama": nama,
    "telpon": telpon,
  };
}
