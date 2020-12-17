// To parse this JSON data, do
//
//     final listBitSuplier = listBitSuplierFromJson(jsonString);

import 'dart:convert';

ListBitSuplier listBitSuplierFromJson(String str) => ListBitSuplier.fromJson(json.decode(str));

String listBitSuplierToJson(ListBitSuplier data) => json.encode(data.toJson());

class ListBitSuplier {
  ListBitSuplier({
    this.hasil,
    this.message,
    this.result,
  });

  bool hasil;
  String message;
  List<Result> result;

  factory ListBitSuplier.fromJson(Map<String, dynamic> json) => ListBitSuplier(
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
    this.suplier,
    this.barang,
    this.nominal,
    this.created,
    this.v,
    this.menang,
  });

  String id;
  Suplier suplier;
  Barang barang;
  int nominal;
  DateTime created;
  int v;
  bool menang;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    suplier: Suplier.fromJson(json["suplier"]),
    barang: Barang.fromJson(json["barang"]),
    nominal: json["nominal"],
    created: DateTime.parse(json["created"]),
    v: json["__v"],
    menang: json["menang"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "suplier": suplier.toJson(),
    "barang": barang.toJson(),
    "nominal": nominal,
    "created": created.toIso8601String(),
    "__v": v,
    "menang": menang,
  };
}

class Barang {
  Barang({
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

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
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

class Suplier {
  Suplier({
    this.id,
    this.username,
    this.password,
    this.tipe,
    this.createdAt,
    this.email,
    this.telp,
    this.fullname,
    this.v,
  });

  String id;
  String username;
  String password;
  String tipe;
  DateTime createdAt;
  String email;
  String telp;
  String fullname;
  int v;

  factory Suplier.fromJson(Map<String, dynamic> json) => Suplier(
    id: json["_id"],
    username: json["Username"],
    password: json["Password"],
    tipe: json["Tipe"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    email: json["Email"],
    telp: json["Telp"],
    fullname: json["Fullname"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Username": username,
    "Password": password,
    "Tipe": tipe,
    "CreatedAt": createdAt.toIso8601String(),
    "Email": email,
    "Telp": telp,
    "Fullname": fullname,
    "__v": v,
  };
}
