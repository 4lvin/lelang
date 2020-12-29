import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/listransaksisuplier.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/loopbase64toimage.dart';
import 'package:path_provider/path_provider.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  String username;
  String id;
  String token;
  @override
  void initState(){
    getKdUser().then((value) {
      blocMember.GetBitSuplier(value);
      setState(() {
        username = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorses.hijauDasar,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey
                  )
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 12,left: 12,top: 30,bottom: 30),
                child: Text(
                  'Riwayat Transaksi',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Expanded(child: StreamBuilder(
              stream: blocMember.ResListBitSuplier,
              builder: (context,AsyncSnapshot<ListBitSuplier> snapshot){
                if(snapshot.hasData){
                  if(snapshot.data.hasil == true){
                    print(snapshot.data.result.length);
                    return GridView.builder(
                        itemCount: snapshot.data.result.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: widthScreen/(heightScreen * 0.47)
                        ),
                        itemBuilder: (context, int i){
                          return GestureDetector(
                            onTap: (){
                              print(snapshot.data.result[i].barang);
                            },
                            child: Container(
                              // height: MediaQuery.of(context).size.height *0.4,
                              // padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2,2),
                                    blurRadius: 6,
                                    spreadRadius: 0
                                  )
                                ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                      child: Center(
                                        child: LoopDisplayPictureScreen(imageAnalysed:snapshot.data.result[i].barang.image, number:i.toString()),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                                    child: Text(
                                      snapshot.data.result[i].barang.jenis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Durasi Pelelangan'
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '02 : 43 : 16',
                                            style: TextStyle(
                                              color: colorses.hijauDurasi,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                                'Bit'
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              NumberFormat.currency(locale: 'id', symbol: 'Rp ').format(snapshot.data.result[i].nominal),
                                              // snapshot.data.result[i].nominal,
                                              style: TextStyle(
                                                  color: colorses.hijauDurasi,
                                                  fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  )
                                ],
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
            )),
          ],
        )


        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Container(
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //         color: colorses.hijauDasar,
        //         border: Border(
        //           bottom: BorderSide(
        //             color: Colors.grey
        //           )
        //         ),
        //       ),
        //       child: Padding(
        //         padding: EdgeInsets.only(right: 12, left: 12, top: 30,bottom: 30),
        //         child: Text(
        //           'Riwayat Transaksi',
        //           style: TextStyle(
        //             fontWeight: FontWeight.w700,
        //             fontSize: 20,
        //             color: Colors.white
        //           ),
        //         ),
        //       ),
        //     ),
        //     // Divider(),
        //     Expanded(
        //       child: ListView(
        //         padding: EdgeInsets.zero,
        //         children: <Widget>[
        //           Container(
        //             margin: EdgeInsets.all(5),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               border: Border.all(color: Colors.grey),
        //               color: Colors.white,
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey,
        //                   offset: Offset(2,2),
        //                   blurRadius: 6,
        //                   spreadRadius: 0
        //                 )
        //               ]
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 ClipRRect(
        //                   borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        //                   child: Image(
        //                     fit: BoxFit.cover,
        //                     image: AssetImage('assets/image/udang3.jpeg'),
        //                     height: MediaQuery.of(context).size.height * 0.4,
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
        //                   child: Text(
        //                     'Udang',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.w600
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
        //                   child: Text(
        //                     'Udang Merah',
        //                     style: TextStyle(
        //                         fontSize: 18,
        //                         fontWeight: FontWeight.w700
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: <Widget>[
        //                       Container(
        //                         child: Text(
        //                             'Durasi Pelanggan'
        //                         ),
        //                       ),
        //                       Container(
        //                         child: Text(
        //                           '02 : 43 : 16',
        //                           style: TextStyle(
        //                               color: colorses.hijauDurasi,
        //                               fontWeight: FontWeight.w600
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: <Widget>[
        //                       Container(
        //                         child: Text(
        //                             'Harga saat ini'
        //                         ),
        //                       ),
        //                       Container(
        //                         child: Text(
        //                           'Rp. 7.500.000',
        //                           style: TextStyle(
        //                               color: colorses.hijauHarga,
        //                               fontWeight: FontWeight.w600
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.all(5),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 border: Border.all(color: Colors.grey),
        //                 color: Colors.white,
        //                 boxShadow: [
        //                   BoxShadow(
        //                       color: Colors.grey,
        //                       offset: Offset(2,2),
        //                       blurRadius: 6,
        //                       spreadRadius: 0
        //                   )
        //                 ]
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 ClipRRect(
        //                   borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        //                   child: Image(
        //                     fit: BoxFit.cover,
        //                     image: AssetImage('assets/image/udang4.png'),
        //                     height: MediaQuery.of(context).size.height * 0.4,
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
        //                   child: Text(
        //                     'Udang',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.w600
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
        //                   child: Text(
        //                     'Udang Merah',
        //                     style: TextStyle(
        //                         fontSize: 18,
        //                         fontWeight: FontWeight.w700
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: <Widget>[
        //                       Container(
        //                         child: Text(
        //                             'Durasi Pelanggan'
        //                         ),
        //                       ),
        //                       Container(
        //                         child: Text(
        //                           '02 : 43 : 06',
        //                           style: TextStyle(
        //                               color: colorses.hijauDurasi,
        //                               fontWeight: FontWeight.w600
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: <Widget>[
        //                       Container(
        //                         child: Text(
        //                             'Harga saat ini'
        //                         ),
        //                       ),
        //                       Container(
        //                         child: Text(
        //                           'Rp. 7.500.000',
        //                           style: TextStyle(
        //                               color: colorses.hijauHarga,
        //                               fontWeight: FontWeight.w600
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      )

      ,
    );
  }
}