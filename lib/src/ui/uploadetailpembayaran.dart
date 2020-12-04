
import 'package:flutter/material.dart';

class UpDetPembayaran extends StatefulWidget {
  UpDetPembayaran({this.image, this.nama, this.deskripsi, this.beratproduk, this.ukuranproduk, this.timbangan});
  String image;
  String nama;
  String deskripsi;
  String beratproduk;
  String ukuranproduk;
  String timbangan;

  @override
  _UpDetPembayaranState createState() => _UpDetPembayaranState();
}

class _UpDetPembayaranState extends State<UpDetPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text('Detail Pembayaran',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
