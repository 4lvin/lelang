
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/getLelangDetailModel.dart';
import 'package:lelangapp/src/ui/ngebit.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/loopbase64toimage.dart';
import 'package:page_transition/page_transition.dart';

class BitLelang2 extends StatefulWidget {
  BitLelang2({this.a, this.judul});
  String a;
  String judul;
  @override
  _BitLelang2State createState() => _BitLelang2State();
}

class _BitLelang2State extends State<BitLelang2> with TickerProviderStateMixin {
  var m;
  var selisih;
  DateTime sekarang;
  AnimationController controller;

  @override
  void initState(){
    blocMember.DetailLelang(widget.a);
    blocMember.detailLelang.listen((event) {
      var adds          = DateTime.parse(event.result.panen);
      var parsedEndDate = adds.add(new Duration(days: 1));
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
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      sekarang = new DateTime.now();
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 15,
        ),
        title: Text(
          widget.judul,
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alert, color: Colors.grey,),
            onPressed: () {
              print('as');
            },
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
          stream: blocMember.detailLelang,
          builder: (context,AsyncSnapshot<Getdetailelang> snapshot){
            if(snapshot.hasData){
              if(snapshot.data.hasil == true){
                return ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0,1),
                                blurRadius: 2,
                                spreadRadius: 0
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: LoopDisplayPictureScreen(imageAnalysed:snapshot.data.result.image,number:snapshot.data.result.id),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text('Durasi pelelangan'),
                          ),
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                                'Harga saat ini'
                            ),
                          ),
                          Container(
                            child: Text(
                              // 'Rp ' + snapshot.data.result.harga,
                              NumberFormat.currency(locale: 'id', symbol: 'Rp ').format(snapshot.data.result.harga),
                              style: TextStyle(
                                  color: colorses.hijauHarga
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0,1),
                                blurRadius: 2,
                                spreadRadius: 0
                            )
                          ]
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Deskripsi',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: Text(
                              snapshot.data.result.deskripsi,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                      'Berat'
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      snapshot.data.result.berat.toString() + ' kg'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                      'Ukuran'
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      snapshot.data.result.ukuran
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                      'Timbangan'
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      "Udang "+snapshot.data.result.timbangan
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0,1),
                                blurRadius: 2,
                                spreadRadius: 0
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Lokasi',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              snapshot.data.result.lokasi,
                              textAlign: TextAlign.justify,
                              style: TextStyle(

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Material(
                        shadowColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorses.hijauDasar,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            elevation: 9.0,
                            color: Colors.transparent,
                            shadowColor: Colors.grey[50],
                            child: InkWell(
                              splashColor: Colors.white30,
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: NgeBit(id: snapshot.data.result.id,judul: snapshot.data.result.judul,),
                                        type: null
                                    )
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width - 70,
                                height: 50,
                                child: Center(
                                    child: Text(
                                      "IKUT PELELANGAN",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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