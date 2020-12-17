import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:lelangapp/src/models/getCheckOtpModel.dart';
import 'package:lelangapp/src/models/getLelangDetailModel.dart';
import 'package:lelangapp/src/models/getListLelangPetani.dart';
import 'package:lelangapp/src/models/getLoginModel.dart';
import 'dart:io';

import 'package:lelangapp/src/models/getRegisterModel.dart';
import 'package:lelangapp/src/models/listlelangaktif.dart';
import 'package:lelangapp/src/models/listransaksisuplier.dart';
import 'package:lelangapp/src/models/postLelang.dart';
import 'package:lelangapp/src/models/postNgebit.dart';

class ApiProviders {
  String url = "https://jongjava.tech/lelang/restapi";
  // String url2 = "http://192.168.100.19:3000";
  String url2 = "http://192.168.1.3:3000";
  // String url2 = "http://192.168.89.13:3000";

  Future register(
      String nama, String email, String telp, String pass, String tipe) async {
    var body = jsonEncode({
      'nama': nama,
      'email': email,
      'telpon': telp,
      'password': pass,
      'token': "",
      'tipe': tipe
    });
    try {
      final post = await client
          .post("$url/C_user/register",
              headers: {"Content-Type": "application/json"}, body: body)
          .timeout(const Duration(seconds: 11));
      if (post.statusCode == 200) {
        print(post.body);
        return GetRegisterModel.fromJson(json.decode(post.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future checkOtp(String email, String otp) async {
    var body = jsonEncode({'email': email, 'otp': otp});
    try {
      final checkId = await client
          .post("$url/C_user/check_otp",
          headers: {"Content-Type": "application/json"}, body: body)
          .timeout(const Duration(seconds: 11));
      if (checkId.statusCode == 200) {
        return GetCheckOtpModel.fromJson(json.decode(checkId.body));
      } else if (checkId.statusCode == 404) {
        return print("not found");
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    try {
      final checkId = await client
          .post("$url/C_user/login",
          headers: {"Content-Type": "application/json"}, body: body)
          .timeout(const Duration(seconds: 11));
      if (checkId.statusCode == 200) {
        return GetLoginModel.fromJson(json.decode(checkId.body));
      } else if (checkId.statusCode == 404) {
        return GetLoginModel.fromJson(json.decode(checkId.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getLIstLelang(String petani) async {
    final getList = await client.get("$url2/v1/lelang/list/$petani");
    if (getList.statusCode  ==  200){
      return Getlistlelangpetani.fromJson(json.decode(getList.body));
    } else {
      throw Exception('Failed to Load Setor');
    }
  }

  Future detailLelang(String id) async {
    final getList = await client.get("$url2/v1/lelang/detail/$id");
    if(getList.statusCode == 200) {
      return Getdetailelang.fromJson(json.decode(getList.body));
    } else {
      throw Exception('Failed to Load Setor');
    }
  }

  Future postLelang(String username, String image, String panen,String judul,String ukuranproduk,String harga,String timbangan,String lokasi, String jenis, String deskripsi, String berat) async {
    var body = jsonEncode({'Username': username, 'image': image, 'panen':panen, 'judul':judul, 'ukuran':ukuranproduk, 'harga':harga, 'timbangan':timbangan, 'lokasi':lokasi, 'jenis':jenis, 'deskripsi':deskripsi, 'berat':berat});
    try {
      final getRes = await client
          .post("$url2/v1/lelang/lelang",
          headers: {"Content-Type": "application/json"}, body: body)
          .timeout(const Duration(seconds: 11));
      // return Getlistlelangpetani.fromJson(json.decode(getRes.body));
      if (getRes.statusCode  ==  200){
        return Postlelang.fromJson(json.decode(getRes.body));
      } else {
        throw Exception('Failed to Load Setor');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future GetLelangAktif() async {
    final getList = await client.get("$url2/v1/lelang/aktif");
    if (getList.statusCode  ==  200){
      return Lelangaktif.fromJson(json.decode(getList.body));
    } else {
      throw Exception('Failed to Load Setor');
    }
  }

  Future PostBit(String Username, String id, String nominal) async {
    var body = jsonEncode({'Username': Username, 'id':id, 'nominal': nominal});
    try {
      final getRes = await client
          .post("$url2/v1/bit/ngebit",
        headers: {"Content-Type": "application/json"},
        body: body
      )
    .timeout(const Duration(seconds: 11));
      if (getRes.statusCode  ==  200){
        return Ngebit.fromJson(json.decode(getRes.body));
      } else {
        throw Exception('Failed to Load Setor');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future GetListBitSuplier(String Username) async {
    var body = jsonEncode({'Username': Username});
    try {
      final getRes = await client
          .post("$url2/v1/bit/allbysuplier",
          headers: {"Content-Type": "application/json"},
          body: body
      )
          .timeout(const Duration(seconds: 11));
      if (getRes.statusCode  ==  200){
        return ListBitSuplier.fromJson(json.decode(getRes.body));
      } else {
        throw Exception('Failed to Load Setor');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}
