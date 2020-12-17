// To parse this JSON data, do
//
//     final ngebit = ngebitFromJson(jsonString);

import 'dart:convert';

Ngebit ngebitFromJson(String str) => Ngebit.fromJson(json.decode(str));

String ngebitToJson(Ngebit data) => json.encode(data.toJson());

class Ngebit {
  Ngebit({
    this.hasil,
    this.message,
  });

  bool hasil;
  String message;

  factory Ngebit.fromJson(Map<String, dynamic> json) => Ngebit(
    hasil: json["hasil"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
    "message": message,
  };
}
