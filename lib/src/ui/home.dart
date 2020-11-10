import 'package:flutter/material.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/ikutlelang.dart';
import 'package:lelangapp/src/ui/publishLelang.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: tipe=="Petani"?Column(
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
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Lelangan',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.search),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                        ),
                        Container(
                          child: Icon(Icons.add_alert),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: widthScreen/(heightScreen * 1.1),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
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
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                              child: Center(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/image/udang1.jpg'
                                  ),
                                  height: MediaQuery.of(context).size.height * 0.25,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                              child: Text(
                                'Udang Pak Tarno', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                              child: Text(
                                'Udang Kering', style: TextStyle(
                                  fontSize: 10
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                              child: Text('12 Ton', style: TextStyle(
                                fontSize: 10,
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                              child: Text('Rp. 12.000.000', style: TextStyle(
                                  color: Color.fromRGBO(0,142,118, 1),
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person_pin_circle, size: 12,),
                                  Text("Pasuruan Timur")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
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
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Center(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/image/udang2.jpg'
                                  ),
                                  height: MediaQuery.of(context).size.height * 0.25,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                              child: Text(
                                'Udang pak Udin', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                              child: Text(
                                'Udang Basah', style: TextStyle(
                                  fontSize: 10
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                              child: Text('15 Ton', style: TextStyle(
                                fontSize: 10,
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                              child: Text('Rp. 20.000.000', style: TextStyle(
                                  color: Color.fromRGBO(0,142,118, 1),
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person_pin_circle, size: 12,),
                                  Text("Pasuruan Timur")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
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
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Center(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/image/udang3.jpeg'
                                  ),
                                  height: MediaQuery.of(context).size.height * 0.25,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                              child: Text(
                                'Udang pak Tono', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                              child: Text(
                                'Udang Kering', style: TextStyle(
                                  fontSize: 10
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                              child: Text('12 Ton', style: TextStyle(
                                fontSize: 10,
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                              child: Text('Rp. 10.000.000', style: TextStyle(
                                  color: Color.fromRGBO(0,142,118, 1),
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person_pin_circle, size: 12,),
                                  Text("Pasuruan Timur")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ):Column(
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
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Lelangan',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.search),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                        ),
                        Container(
                          child: Icon(Icons.add_alert),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: widthScreen/(heightScreen * 1.1),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 200),
                                child: BitLelang()));
                      },
                      child: Container(
                        margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
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
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                child: Center(
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/image/udang1.jpg'
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.25,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                                child: Text(
                                  'Udang Pak Tarno on tap', style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700
                                ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                                child: Text(
                                  'Udang Kering', style: TextStyle(
                                    fontSize: 10
                                ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                                child: Text('12 Ton', style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                                child: Text('Rp. 12.000.000', style: TextStyle(
                                    color: Color.fromRGBO(0,142,118, 1),
                                    fontWeight: FontWeight.w600
                                ),),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.person_pin_circle, size: 12,),
                                    Text("Pasuruan Timur")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(username);
                        blocMember.listlelangpetani(username);
                        blocMember.listLelang.listen((value) {
                          print(value.hasil);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
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
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                child: Center(
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/image/udang2.jpg'
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.25,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                                child: Text(
                                  'Udang pak Udin', style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700
                                ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                                child: Text(
                                  'Udang Basah', style: TextStyle(
                                    fontSize: 10
                                ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                                child: Text('15 Ton', style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                                child: Text('Rp. 20.000.000', style: TextStyle(
                                    color: Color.fromRGBO(0,142,118, 1),
                                    fontWeight: FontWeight.w600
                                ),),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.person_pin_circle, size: 12,),
                                    Text("Pasuruan Timur")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only( bottom: 10, left: 5, right: 5),
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
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Center(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/image/udang3.jpeg'
                                  ),
                                  height: MediaQuery.of(context).size.height * 0.25,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                              child: Text(
                                'Udang pak Tono', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 0, right: 5, left: 5),
                              child: Text(
                                'Udang Kering', style: TextStyle(
                                  fontSize: 10
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.0, bottom: 5.0, right: 5.0, left: 5.0),
                              child: Text('12 Ton', style: TextStyle(
                                fontSize: 10,
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 5.0),
                              child: Text('Rp. 10.000.000', style: TextStyle(
                                  color: Color.fromRGBO(0,142,118, 1),
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person_pin_circle, size: 12,),
                                  Text("Pasuruan Timur")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: tipe=="Petani"?FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.publish),
            backgroundColor: colorses.hijauDasar,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 200),
                      child: PublishLelang()));
            }):Container());
  }
}