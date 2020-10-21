// To parse this JSON data, do
//
//     final getdetailelang = getdetailelangFromJson(jsonString);

import 'dart:convert';

Getdetailelang getdetailelangFromJson(String str) => Getdetailelang.fromJson(json.decode(str));

String getdetailelangToJson(Getdetailelang data) => json.encode(data.toJson());

class Getdetailelang {
  Getdetailelang({
    this.hasil,
    this.message,
    this.result,
  });

  bool hasil;
  String message;
  Result result;

  factory Getdetailelang.fromJson(Map<String, dynamic> json) => Getdetailelang(
    hasil: json["hasil"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.id,
    this.petani,
    this.image,
    this.panen,
    this.judul,
    this.ukuran,
    this.harga,
    this.timbangan,
    this.lokasi,
    this.created,
    this.v,
  });

  String id;
  String petani;
  String image;
  String panen;
  String judul;
  String ukuran;
  String harga;
  String timbangan;
  String lokasi;
  DateTime created;
  int v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    petani: json["petani"],
    image: json["image"],
    panen: json["panen"],
    judul: json["judul"],
    ukuran: json["ukuran"],
    harga: json["harga"],
    timbangan: json["timbangan"],
    lokasi: json["lokasi"],
    created: DateTime.parse(json["created"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "petani": petani,
    "image": image,
    "panen": panen,
    "judul": judul,
    "ukuran": ukuran,
    "harga": harga,
    "timbangan": timbangan,
    "lokasi": lokasi,
    "created": created.toIso8601String(),
    "__v": v,
  };
}
