
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/getListLelangPetani.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/HomeTengkulak.dart';
import 'package:lelangapp/src/ui/home2.dart';
import 'package:lelangapp/src/ui/listbitlelang.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:lelangapp/src/ui/utils/loopbase64toimage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';

class HomePetani extends StatefulWidget {
  @override
  _HomePetaniState createState() => _HomePetaniState();
}

class _HomePetaniState extends State<HomePetani> {
  String nama;
  String tipe;
  String username;
  File fileImg;
  var directory;
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat pagi ${nama ?? ""}';
    }
    if (hour < 15) {
      return 'Selamat siang ${nama ?? ""}';
    }
    if (hour < 17) {
      return 'Selamat sore ${nama ?? ""}';
    }
    return 'Selamat malam ${nama ?? ""}';
  }

  @override
  void initState() {
    getNama().then((value) {
      if (mounted) {
        setState(() {
          nama = value;
        });
      }
    });
    getKdUser().then((value) {
      setState(() {
        username = value;
      });
    });
    getTipe().then((value){
      if (mounted) {
        setState(() {
          tipe = value;
        });
      }
    });
    getTipe().then((value) {
      if(value == "Petani"){
        getKdUser().then((value2) {
          blocMember.listlelangpetani(value2);
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                child: CustomBackgroundHome(),
              ),
              Positioned(
                  top: 50,
                  left: 12,
                  child: Text(
                    greeting(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: blocMember.listLelang,
              builder: (context,AsyncSnapshot<Getlistlelangpetani> snapshot){
                // print(snapshot.hasData);
                if(snapshot.hasData){
                  if(snapshot.data.hasil == true) {
                    return GridView.builder(
                        itemCount: snapshot.data.result.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: widthScreen/(heightScreen * 1)
                        ),
                        itemBuilder: (context, int i){
                          return GestureDetector(
                            onTap: (){
                              print('asd');
                              // print(snapshot.data.result[i].id, snapshot.data.result[i].judul);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: PageListBitLelang(id: snapshot.data.result[i].id,),
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 200)
                                  )
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1,1),
                                        blurRadius: 1
                                    )
                                  ]
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                        child: Center(
                                          // child: Image(
                                          //   fit: BoxFit.cover,
                                          //   image: AssetImage(
                                          //     snapshot.data.result[i].image
                                          //   ),
                                          //   height: MediaQuery.of(context).size.height * 0.25,
                                          // ),
                                          child: LoopDisplayPictureScreen(imageAnalysed: snapshot.data.result[i].image, number:i.toString()),
                                        ),
                                      ),
                                      height: MediaQuery.of(context).size.height / 3,
                                      padding: EdgeInsets.all(10),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                                      child: Text(
                                        snapshot.data.result[i].judul,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                                      child: Text(
                                        snapshot.data.result[i].ukuran + " Ton",
                                        style: TextStyle(
                                            fontSize: 10
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                                      child: Text(
                                        // snapshot.data.result[i].harga,
                                        NumberFormat.currency(locale: 'id', symbol: 'Rp ').format(snapshot.data.result[i].harga),
                                        style: TextStyle(
                                            color: Color.fromRGBO(0,142,118, 1),
                                            fontWeight: FontWeight.w600
                                        ),),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.person_pin_circle, size: 12,),
                                          Text(snapshot.data.result[i].lokasi)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  } else {
                    return Container();
                  }

                } else {
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}