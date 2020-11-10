// To parse this JSON data, do
//
//     final getlistlelangpetani = getlistlelangpetaniFromJson(jsonString);

import 'dart:convert';

Getlistlelangpetani getlistlelangpetaniFromJson(String str) => Getlistlelangpetani.fromJson(json.decode(str));

String getlistlelangpetaniToJson(Getlistlelangpetani data) => json.encode(data.toJson());

class Getlistlelangpetani {
  Getlistlelangpetani({
    this.hasil,
    this.message,
    this.result,
  });

  bool hasil;
  String message;
  List<Result> result;

  factory Getlistlelangpetani.fromJson(Map<String, dynamic> json) => Getlistlelangpetani(
    hasil: json["hasil"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
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
    this.jenis,
    this.deskripsi,
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
  String jenis;
  String deskripsi;
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
    jenis: json["jenis"],
    deskripsi: json["deskripsi"],
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
    "jenis": jenis,
    "deskripsi": deskripsi,
    "created": created.toIso8601String(),
    "__v": v,
  };
}
