
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lelangapp/src/ui/uploadetailpembayaran.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

class UpProDetail extends StatefulWidget {
  UpProDetail({this.image});
  String image;
  @override
  _UpProDetailState createState() => _UpProDetailState();
}

class _UpProDetailState extends State<UpProDetail> {
  var _nama         = TextEditingController();
  var _jenis        = TextEditingController();
  var _deskripsi    = TextEditingController();
  var _beratproduk  = TextEditingController();
  var _ukuranproduk = TextEditingController();

  String _timbanganList;
  List _listTimbangan = ["Kering", "Basah","Campur"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text('Detail Produk', style: TextStyle(
            color: Colors.black
        ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20,right: 10,left: 10),
           child: ListView(
             children: [
               Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    // style: TextStyle(height: 1),
                    controller: _nama,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(0.0),
                        ),
                      ),
                      // hintText: "Nama Produk",
                        labelText: "Nama Produk",
                      fillColor: Colors.white,
                      filled: true
                    ),
                    onChanged: (value){
                      setState(() {

                      });
                    },
                  ),
                ),
               Container(
                 padding: EdgeInsets.all(10),
                 child: TextField(
                   controller: _jenis,
                   // style: TextStyle(height: 1),
                   decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: const BorderRadius.all(
                           const Radius.circular(0.0),
                         ),
                       ),
                       // hintText: "Jenis",
                       labelText: "Jenis",
                       fillColor: Colors.white,
                       filled: true
                   ),
                   onChanged: (value){
                     setState(() {

                     });
                   },
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 child: TextField(
                   controller: _deskripsi,
                   // style: TextStyle(height: 1),
                   decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: const BorderRadius.all(
                           const Radius.circular(0.0),
                         ),
                       ),
                       // hintText: "Deskripsi",
                       labelText: "Deskripsi",
                       fillColor: Colors.white,
                       filled: true
                   ),
                   onChanged: (value){
                     setState(() {

                     });
                   },
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 child: TextField(
                   // style: TextStyle(height: 1),
                   controller: _beratproduk,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     suffix: Container(
                       child: Text('/Kg'),
                     ),
                       border: OutlineInputBorder(
                         borderRadius: const BorderRadius.all(
                           const Radius.circular(0.0),
                         ),
                       ),
                       // hintText: "Berat Produk",
                       labelText: "berat Produk",
                       fillColor: Colors.white,
                       filled: true
                   ),
                   onChanged: (value){
                     setState(() {

                     });
                   },
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 child: TextField(
                   controller: _ukuranproduk,
                   // style: TextStyle(height: 1),
                   decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: const BorderRadius.all(
                           const Radius.circular(0.0),
                         ),
                       ),
                       // hintText: "Ukuran Produk",
                       labelText: "Ukuran Produk",
                       fillColor: Colors.white,
                       filled: true
                   ),
                   onChanged: (value){
                     setState(() {

                     });
                   },
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 child: Center(
                   child: DropdownButton(
                     hint: Text("Timbangan"),
                     value: _timbanganList,
                     items: _listTimbangan.map((value) {
                       return DropdownMenuItem(
                         child: Text(value),
                         value: value,);
                     }).toList(),
                     onChanged: (value) {
                       setState(() {
                         _timbanganList = value;
                       });
                     },
                   ),
                 )
               )
             ],
           ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: _nama.text.isEmpty || _deskripsi.text.isEmpty || _beratproduk.text.isEmpty || _ukuranproduk.text.isEmpty || _jenis.text.isEmpty || _timbanganList == null?
            null :
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(25),
                  color: colorses.hijauDasar,
                ),
                child: Material(
                  borderRadius:  BorderRadius.circular(25),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.green,
                    borderRadius:  BorderRadius.circular(25),
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              child: UpDetPembayaran(image:widget.image,nama:_nama.text,deskripsi:_deskripsi.text,beratproduk:_beratproduk.text,ukuranproduk:_ukuranproduk.text,timbangan:_timbanganList, jenis: _jenis.text,),
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 200)
                          )
                      );
                    },
                    child: Center(
                        child: new Icon(Icons.keyboard_arrow_right, color: Colors.white,)
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}