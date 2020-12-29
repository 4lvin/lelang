
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/listbitbylelang.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:path_provider/path_provider.dart';

class PageListBitLelang extends StatefulWidget {
  PageListBitLelang({this.id});
  String id;
  @override
  _PageListBitLelangState createState() => _PageListBitLelangState();
}

class _PageListBitLelangState extends State<PageListBitLelang> {
  String username;
  @override
  void initState(){
    getKdUser().then((value) {
      blocMember.GetBitLelag(value, widget.id);
      setState(() {
        username = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
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
                            child: DisplayPictureScreen(imageAnalysed:snapshot.data.barang.image,nama:snapshot.data.barang.id)
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
                            Container(
                              child: Text('21 : 10 : 11'),
                            )
                          ],
                        ),
                      ),
                      snapshot.data.panjang != 0?
                      // Container(
                      //   padding: EdgeInsets.all(10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         child: Text('abdul'),
                      //       ),
                      //       Container(
                      //         child: Text('50000'),
                      //       )
                      //     ],
                      //   ),
                      // )
                      // Expanded(
                      //   child: GridView.builder(
                      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 1,
                      //       ),
                      //       itemCount: snapshot.data.result.length,
                      //       itemBuilder: (context, int i){
                      //         return Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.yellow
                      //           ),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Container(
                      //                 child: Text(
                      //                     snapshot.data.result[i].suplier.fullname
                      //                 ),
                      //               ),
                      //               Container(
                      //                 child: Text(
                      //                     snapshot.data.result[i].nominal.toString()
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         );
                      //       }
                      //   ),
                      // )

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


class DisplayPictureScreen extends StatefulWidget {
  final String imageAnalysed;
  final String nama;
  const DisplayPictureScreen({Key key, this.imageAnalysed, this.nama}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  File fileImg;
  bool isLoading = true;

  void writeFile() async {
    final decodedBytes = base64Decode(widget.imageAnalysed);
    final directory = await getApplicationDocumentsDirectory();
    fileImg = File('${directory.path}/'+widget.nama+'.png');
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