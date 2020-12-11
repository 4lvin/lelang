// To parse this JSON data, do
//
//     final postlelang = postlelangFromJson(jsonString);

import 'dart:convert';

Postlelang postlelangFromJson(String str) => Postlelang.fromJson(json.decode(str));

String postlelangToJson(Postlelang data) => json.encode(data.toJson());

class Postlelang {
  Postlelang({
    this.hasil,
    this.message,
  });

  bool hasil;
  String message;

  factory Postlelang.fromJson(Map<String, dynamic> json) => Postlelang(
    hasil: json["hasil"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
    "message": message,
  };
}
