
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/listbitbylelang.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/utils/loopbase64toimage.dart';
import 'package:path_provider/path_provider.dart';

class PageListBitLelang extends StatefulWidget {
  PageListBitLelang({this.id});
  String id;
  @override
  _PageListBitLelangState createState() => _PageListBitLelangState();
}

class _PageListBitLelangState extends State<PageListBitLelang> with TickerProviderStateMixin{
  String username;
  DateTime sekarang;
  var m;
  var selisih;
  AnimationController controller;
  @override
  void initState(){
    getKdUser().then((value) {
      blocMember.GetBitLelag(value, widget.id);
      blocMember.ResListBitLelang.listen((event) {
        var parsedEndDate = DateTime.parse(event.barang.panen);

        setState(() {
          m = parsedEndDate.difference(sekarang).inMinutes;
          selisih = parsedEndDate.difference(sekarang).inHours;
          controller = AnimationController(
              vsync: this,
              duration: Duration(
                  hours: selisih,
                  minutes: m - selisih * 60,
                  seconds: parsedEndDate.second));
          controller.reverse(
              from: controller.value == 0.0 ? 1.0 : controller.value);
        });
      });
      setState(() {
        username = value;
      });
    });
  }
  String get timerString {
    Duration duration = controller.duration * controller.value;
    if (duration.inHours >= 24) {
      var hari = duration.inHours / 24;
      var pembulatan = hari.ceil();
      return  pembulatan.toString() + ' hari';
    } else if(duration.inHours <=  0 && duration.inMinutes <= 0) {
      return 'Selesai';
    } else {
      return '${duration.inHours} : ${duration.inMinutes - selisih * 60} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      sekarang = new DateTime.now();
    });
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text('Detail Lelang',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: StreamBuilder(
          stream: blocMember.ResListBitLelang,
          builder: (context,AsyncSnapshot<ListBitLelang> snapshot){
            if(snapshot.hasData){
              if(snapshot.data.hasil == true){
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        padding: EdgeInsets.only(top: 10),
                        child: ClipRRect(
                          child: Center(
                            child: LoopDisplayPictureScreen(imageAnalysed:snapshot.data.barang.image,number:snapshot.data.barang.id)
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          snapshot.data.barang.judul,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text('Durasi pelelangan'),
                            ),
                            // Container(
                            //   child: Text('21 : 10 : 11'),
                            // )
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                          ],
                        ),
                      ),
                      snapshot.data.panjang != 0?
                      Container(
                        child: Column(
                          children: List.generate(snapshot.data.result.length, (index){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    snapshot.data.result[index].suplier.fullname
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    snapshot.data.result[index].nominal.toString()
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      )
                          :
                      Container()
                    ],
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}