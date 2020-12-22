// To parse this JSON data, do
//
//     final listBitLelang = listBitLelangFromJson(jsonString);

import 'dart:convert';

ListBitLelang listBitLelangFromJson(String str) => ListBitLelang.fromJson(json.decode(str));

String listBitLelangToJson(ListBitLelang data) => json.encode(data.toJson());

class ListBitLelang {
  ListBitLelang({
    this.hasil,
    this.message,
    this.panjang,
    this.barang,
    this.result,
  });

  bool hasil;
  String message;
  int panjang;
  Barang barang;
  List<Result> result;

  factory ListBitLelang.fromJson(Map<String, dynamic> json) => ListBitLelang(
    hasil: json["hasil"],
    message: json["message"],
    panjang: json["panjang"],
    barang: Barang.fromJson(json["barang"]),
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hasil": hasil,
    "message": message,
    "panjang": panjang,
    "barang": barang.toJson(),
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
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
  String panen;
  String judul;
  String ukuran;
  int harga;
  String timbangan;
  String lokasi;
  String jenis;
  String deskripsi;
  String created;
  int berat;
  int v;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
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
    created: json["created"],
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
    "created": created,
    "berat": berat,
    "__v": v,
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
  String barang;
  int nominal;
  String created;
  int v;
  bool menang;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    suplier: Suplier.fromJson(json["suplier"]),
    barang: json["barang"],
    nominal: json["nominal"],
    created: json["created"],
    v: json["__v"],
    menang: json["menang"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "suplier": suplier.toJson(),
    "barang": barang,
    "nominal": nominal,
    "created": created,
    "__v": v,
    "menang": menang,
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
  String createdAt;
  String email;
  String telp;
  String fullname;
  int v;

  factory Suplier.fromJson(Map<String, dynamic> json) => Suplier(
    id: json["_id"],
    username: json["Username"],
    password: json["Password"],
    tipe: json["Tipe"],
    createdAt: json["CreatedAt"],
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
    "CreatedAt": createdAt,
    "Email": email,
    "Telp": telp,
    "Fullname": fullname,
    "__v": v,
  };
}
