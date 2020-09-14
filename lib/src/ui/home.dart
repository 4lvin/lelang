import 'package:flutter/material.dart';
import 'package:lelangapp/src/pref/preferences.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("List lelang aktif"),
            ),
            Divider(),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.publish),
            backgroundColor: colorses.hijauDasar,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.downToUp,
                      duration: Duration(milliseconds: 200),
                      child: PublishLelang(a: "akuuuuuuuuu",)));
            }));
  }
}
