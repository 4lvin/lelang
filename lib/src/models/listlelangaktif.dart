// To parse this JSON data, do
//
//     final lelangaktif = lelangaktifFromJson(jsonString);

import 'dart:convert';

Lelangaktif lelangaktifFromJson(String str) => Lelangaktif.fromJson(json.decode(str));

String lelangaktifToJson(Lelangaktif data) => json.encode(data.toJson());

class Lelangaktif {
  Lelangaktif({
    this.hasil,
    this.result,
  });

  bool hasil;
  List<Result> result;

  factory Lelangaktif.fromJson(Map<String, dynamic> json) => Lelangaktif(
    hasil: json["hasil"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
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
    this.berat,
    this.v,
  });

  String id;
  String petani;
  String image;
  DateTime panen;
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
    panen: DateTime.parse(json["panen"]),
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
    "panen": "${panen.year.toString().padLeft(4, '0')}-${panen.month.toString().padLeft(2, '0')}-${panen.day.toString().padLeft(2, '0')}",
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
