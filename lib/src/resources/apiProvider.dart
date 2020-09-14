import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as client;
import 'package:lelangapp/src/models/getCheckOtpModel.dart';
import 'package:lelangapp/src/models/getLoginModel.dart';
import 'dart:io';

import 'package:lelangapp/src/models/getRegisterModel.dart';

class ApiProviders {
  String url = "https://jongjava.tech/lelang/restapi";

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
}
