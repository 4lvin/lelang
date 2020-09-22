import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorses.hijauDasar,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey
                  )
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white54,
                //     offset: Offset(0,1),
                //     blurRadius: 2,
                //     spreadRadius: 0
                //   )
                // ]
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 12, left: 12, top: 30,bottom: 30),
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
            // Divider(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
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
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/udang3.jpeg'),
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang',
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang Merah',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    'Durasi Pelanggan'
                                ),
                              ),
                              Container(
                                child: Text(
                                  '02 : 43 : 06',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0,191,165, 1),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
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
                                  'Rp. 7.500.000',
                                  style: TextStyle(
                                      color: Color.fromRGBO(24,152,131, 1),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
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
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/udang4.png'),
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang',
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang Merah',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    'Durasi Pelanggan'
                                ),
                              ),
                              Container(
                                child: Text(
                                  '02 : 43 : 06',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0,191,165, 1),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
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
                                  'Rp. 7.500.000',
                                  style: TextStyle(
                                      color: Color.fromRGBO(24,152,131, 1),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
