
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/getLelangDetailModel.dart';
import 'package:lelangapp/src/ui/ngebit.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';

class BitLelang2 extends StatefulWidget {
  BitLelang2({this.a, this.judul});
  String a;
  String judul;
  @override
  _BitLelang2State createState() => _BitLelang2State();
}

class _BitLelang2State extends State<BitLelang2> {
  Duration mundur = new Duration(hours:2, minutes:3, seconds:2);
  Duration fastestMarathon = new Duration(hours:2, minutes:3, seconds:2);
  var d = Duration(days: 1, hours: 1, minutes: 33, seconds: 50);
  // String durasi = assert(mundur.inMinutes == 123);
  int get hashCode => fastestMarathon.hashCode;

  var stopwatch = new Stopwatch()..start();
  @override
  void initState(){
    blocMember.DetailLelang(widget.a);
  }
  Widget build(BuildContext context) {
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
                              child: DisplayPictureScreen(imageAnalysed:snapshot.data.result.image),
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
                          Container(
                            child: Text(
                              d.toString(),
                              style: TextStyle(
                                  color: colorses.hijauHarga
                              ),
                            ),
                          )
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

class Countdown extends AnimatedWidget {
  Countdown({ Key key, this.animation }) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context){
    var count = animation.value.toInt();
    print("count: $count");
    return new Text(
      count.toString(),
      style: new TextStyle(fontSize: 24.0),
    );
  }
}


class DisplayPictureScreen extends StatefulWidget {
  final String imageAnalysed;
  const DisplayPictureScreen({Key key, this.imageAnalysed}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  File fileImg;
  bool isLoading = true;

  void writeFile() async {
    final decodedBytes = base64Decode(widget.imageAnalysed);
    final directory = await getApplicationDocumentsDirectory();
    fileImg = File('${directory.path}/testImage.png');
    print(fileImg.path);
    fileImg.writeAsBytesSync(List.from(decodedBytes));

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      writeFile();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? CircularProgressIndicator() : Image.file(fileImg);
  }
}
