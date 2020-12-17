
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/loading.dart';
import 'package:sweetalert/sweetalert.dart';

class UpDetPembayaran extends StatefulWidget {
  UpDetPembayaran({this.image, this.nama, this.deskripsi, this.beratproduk, this.ukuranproduk, this.timbangan, this.jenis});
  String image;
  String nama;
  String deskripsi;
  String beratproduk;
  String ukuranproduk;
  String timbangan;
  String jenis;

  @override
  _UpDetPembayaranState createState() => _UpDetPembayaranState();
}

class _UpDetPembayaranState extends State<UpDetPembayaran> {
  var _lokasi     = TextEditingController();
  var _harga      = TextEditingController();
  var _panen      = TextEditingController();

  String username;

  DateTime selectedDate = DateTime.now();

  @override
  void initState(){
    getKdUser().then((value) {
      setState(() {
        username = value;
      });
    });
    _panen.text = DateTime.now().year.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().day.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text('Detail Pembayaran',style: TextStyle(color: Colors.black),),
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
                    style: TextStyle(height: 1),
                    controller: _harga,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(0.0),
                          ),
                        ),
                        // hintText: "Harga",
                        labelText: "Harga",
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
                    controller: _lokasi,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(0.0),
                          ),
                        ),
                        // hintText: "Lokasi",
                        labelText: "Lokasi",
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
                  child: TextFormField(
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                      // labelText: 'Tanggal Panen',
                      hintText: "Tanggal Panen",
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(0.0),
                        ),
                      ),
                    ),
                    controller: _panen,
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100)
                      );
                      var formatDate = date.year.toString() +
                          "-" +
                          date.month.toString() +
                          "-" +
                          date.day.toString();
                      _panen.text = formatDate;
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: _panen.text.isEmpty || _lokasi.text.isEmpty || _harga.text.isEmpty?
            null
            :Align(
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
                      Dialogs.showLoading(context);
                      blocMember.PostLelang(username, widget.image, _panen.text, widget.nama, widget.ukuranproduk, _harga.text, widget.timbangan, _lokasi.text, widget.jenis, widget.deskripsi, widget.beratproduk);
                      print('sebelum respons');
                      blocMember.ResPostLelang.listen((event) {
                        Dialogs.dismiss(context);
                        if(event.hasil == true){
                          SweetAlert.show(
                              context,
                              title: "berhasil",
                              // cancelButtonText: "Ok",
                              confirmButtonText: "Ok",
                              confirmButtonColor: Color(0xff96d873),
                              // subtitle: "Sweet alert is pretty",
                              showCancelButton: false, onPress: (bool isConfirm){
                            if(isConfirm){
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil('/controllPage', (Route<dynamic> route) => false);
                              return false;
                            } else {
                              return null;
                            }
                          }
                          );
                        } else {
                          SweetAlert.show(context, title: "Gagal");

                        }
                      });
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         child: UpDetPembayaran(image:widget.image,nama:_nama.text,deskripsi:_deskripsi.text,beratproduk:_beratproduk.text,ukuranproduk:_ukuranproduk.text,timbangan:_timbanganList),
                      //         type: PageTransitionType.bottomToTop,
                      //         duration: Duration(milliseconds: 200)
                      //     )
                      // );
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