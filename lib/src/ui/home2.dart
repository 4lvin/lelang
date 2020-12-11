
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/models/getListLelangPetani.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/bitlelang2.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:page_transition/page_transition.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String nama;
  String tipe;
  String username;
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
    getKdUser().then((value) {
      blocMember.listlelangpetani(value);
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
        children: <Widget>[
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
                    // return ListView.builder(
                    //     itemCount: snapshot.data.result.length,
                    //     itemBuilder: (context, int i){
                    //       return GestureDetector(
                    //         onTap: () {
                    //           print(snapshot.data.result[i].id);
                    //           Navigator.push(
                    //             context,
                    //             PageTransition(
                    //               child: BitLelang2(a:snapshot.data.result[i].id, judul:snapshot.data.result[i].judul),
                    //               type: PageTransitionType.bottomToTop,
                    //               duration: Duration(milliseconds: 200)
                    //             )
                    //           );
                    //         },
                    //         child: Container(
                    //           margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: Border.all(color: Colors.grey),
                    //               color: Colors.white,
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                     color: Colors.grey,
                    //                     offset: Offset(1,1),
                    //                     blurRadius: 1
                    //                 )
                    //               ]
                    //           ),
                    //           child: Container(
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: <Widget>[
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    //                   child: Center(
                    //                     child: Image(
                    //                       fit: BoxFit.cover,
                    //                       image: AssetImage(
                    //                           snapshot.data.result[i].image
                    //                       ),
                    //                       height: MediaQuery.of(context).size.height * 0.25,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    //                   child: Text(
                    //                     snapshot.data.result[i].judul, style: TextStyle(
                    //                       fontSize: 20, fontWeight: FontWeight.w700
                    //                   ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                    //                   child: Text(
                    //                     'Udang Kering', style: TextStyle(
                    //                       fontSize: 10
                    //                   ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                    //                   child: Text(snapshot.data.result[i].timbangan+' Kg', style: TextStyle(
                    //                     fontSize: 10,
                    //                   ),),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                    //                   child: Text('Rp. '+snapshot.data.result[i].harga, style: TextStyle(
                    //                       color: Color.fromRGBO(0,142,118, 1),
                    //                       fontWeight: FontWeight.w600
                    //                   ),),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.all(5),
                    //                   child: Row(
                    //                     children: <Widget>[
                    //                       Icon(Icons.person_pin_circle, size: 12,),
                    //                       Text(snapshot.data.result[i].lokasi)
                    //                     ],
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    // );
                    return GridView.builder(
                      itemCount: snapshot.data.result.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: widthScreen/(heightScreen * 1.1)
                        ),
                        itemBuilder: (context, int i){
                          return GestureDetector(
                            onTap: (){
                              // print(snapshot.data.result[i].id, snapshot.data.result[i].judul);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: BitLelang2(a: snapshot.data.result[i].id,judul: snapshot.data.result[i].judul,),
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                      child: Center(
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            snapshot.data.result[i].image
                                          ),
                                          height: MediaQuery.of(context).size.height * 0.25,
                                        ),
                                      ),
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


// floatingActionButton: new FloatingActionButton(
// elevation: 0.0,
// child: new Icon(Icons.publish),
// backgroundColor: colorses.hijauDasar,
// onPressed: () {
// Navigator.push(
// context,
// PageTransition(
// type: PageTransitionType.downToUp,
// duration: Duration(milliseconds: 200),
// child: PublishLelang(a: "akuuuuuuuuu",)));
// }));
