
import 'package:flutter/material.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/HomeTengkulak.dart';
import 'package:lelangapp/src/ui/homePetani.dart';

class RouteHome extends StatefulWidget {
  @override
  _RouteHomeState createState() => _RouteHomeState();
}

class _RouteHomeState extends State<RouteHome> {
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
    return tipe  ==  "Petani"? HomePetani():HomePembeli();
  }
}
