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
    this.jenis,
    this.deskripsi,
    this.created,
    this.berat,
    this.v,
  });

  String id;
  String petani;
  String image;
  String panen;
  String judul;
  String ukuran;
  int harga;
  String timbangan;
  String lokasi;
  String jenis;
  String deskripsi;
  DateTime created;
  int berat;
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
    berat: json["berat"],
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
    "berat": berat,
    "__v": v,
  };
}
