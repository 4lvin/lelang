// To parse this JSON data, do
//
//     final postngebit = postngebitFromJson(jsonString);

import 'dart:convert';

Postngebit postngebitFromJson(String str) => Postngebit.fromJson(json.decode(str));

String postngebitToJson(Postngebit data) => json.encode(data.toJson());

class Postngebit {
  Postngebit({
    this.hasil,
    this.message,
  });

  bool hasil;
  String message;

  factory Postngebit.fromJson(Map<String, dynamic> json) => Postngebit(
    hasil: json["hasil"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
    "message": message,
  };
}
