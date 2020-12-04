
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/getLelangDetailModel.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class NgeBit extends StatefulWidget {
  NgeBit({this.id, this.judul});
  String id;
  String judul;
  @override
  _NgeBitState createState() => _NgeBitState();
}

class _NgeBitState extends State<NgeBit> {
  Duration mundur = new Duration(hours:2, minutes:3, seconds:2);
  Duration fastestMarathon = new Duration(hours:2, minutes:3, seconds:2);
  var d = Duration(days: 1, hours: 1, minutes: 33, seconds: 50);
  TextEditingController inputbit = TextEditingController(text:"");
  var _input = TextEditingController();
  Color seket = colorses.hijauHarga;
  Color satus = colorses.hijauHarga;
  bool keyb = true;

  int inputharga;
  @override
  void initState(){
    blocMember.DetailLelang(widget.id);
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

            },
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
          stream: blocMember.detailLelang,
            builder: (context,AsyncSnapshot<Getdetailelang> snapshot){
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
                          child: Image(
                            image: AssetImage(snapshot.data.result.image),
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
                            'Rp ' + snapshot.data.result.harga,
                            style: TextStyle(
                                color: colorses.hijauHarga
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                    color: seket,
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
                                      onTap: (){
                                        setState(() {
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                          if(seket == colorses.tombolaktif){
                                            inputharga = null;
                                            seket = colorses.hijauHarga;
                                          } else {
                                            inputharga = int.parse("50000");
                                            _input = TextEditingController(text: "");
                                            seket = colorses.tombolaktif;
                                            satus = colorses.hijauHarga;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 2.3,
                                        height: 50,
                                        child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:EdgeInsets.only(left: 10),
                                                    child:Text(
                                                      "+",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(right: 10),
                                                    child: Text(
                                                      "Rp 50.000",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
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
                                    color: satus,
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
                                      onTap: (){
                                        setState(() {
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                          if(satus == colorses.tombolaktif){
                                            inputharga = null;
                                            satus = colorses.hijauHarga;
                                          } else {
                                            inputharga = int.parse("100000");
                                            satus = colorses.tombolaktif;
                                            seket = colorses.hijauHarga;
                                            _input.clear();
                                            // _input = TextEditingController(text: "");
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 2.3,
                                        height: 50,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 10),
                                                child: Text(
                                                  "Rp 100.000",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Input Harga Manual',
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: colorses.hijauDasar,
                              border: OutlineInputBorder(
                                // borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0), topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            onChanged: (value){
                              setState(() {
                                inputharga = int.parse(value);
                                seket = colorses.hijauHarga;
                                satus = colorses.hijauHarga;
                              });
                            },
                            onTap: (){
                              setState(() {
                                seket = colorses.hijauHarga;
                                satus = colorses.hijauHarga;
                              });
                            },
                            controller: _input,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
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
                        onTap: (){
                          print(inputharga);
                          print(_input.text);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          child: Center(
                            child: Text("Submit"),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
