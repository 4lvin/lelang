
import 'package:flutter/material.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/transaksiPage.dart';
import 'package:lelangapp/src/ui/upload.dart';

class RoutePage2 extends StatefulWidget {
  @override
  _RoutePage2State createState() => _RoutePage2State();
}

class _RoutePage2State extends State<RoutePage2> {
  String tipe;
  @override
  void initState(){
    getTipe().then((value){
      if (mounted) {
        setState(() {
          tipe = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return tipe  ==  "Petani"? UploadPage():TransaksiPage();
  }
}
