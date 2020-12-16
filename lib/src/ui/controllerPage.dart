import 'package:flutter/material.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/home.dart';
import 'package:lelangapp/src/ui/home2.dart';
import 'package:lelangapp/src/ui/profilePage.dart';
import 'package:lelangapp/src/ui/route2.dart';
import 'package:lelangapp/src/ui/routehome.dart';
import 'package:lelangapp/src/ui/transaksiPage.dart';
import 'package:lelangapp/src/ui/uploadbarang.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:toast/toast.dart';

class ControllerPage extends StatefulWidget {
  ControllerPage({this.selected});
  int selected;
  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int _selectedIndex;
  String tipe;
  final PageStorageBucket bucket = PageStorageBucket();
  DateTime currentBackPressTime;
  final List<Widget> _widgetOptions = [
    // Home(),
    RouteHome(),
    // TransaksiPage(),
    RoutePage2(),
    ProfilePage(),
    HomePage2(),
    // UploadBarang(),
  ];

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toast.show("Tekan sekali lagi untuk keluar", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return Future.value(false);
    }
    return Future.value(true);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    widget.selected == null
        ? _selectedIndex = 0
        : _selectedIndex = widget.selected;
    super.initState();
    getTipe().then((value) {
      if (mounted) {
        setState(() {
          tipe = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          child: PageStorage(
              bucket: bucket, child: _widgetOptions[_selectedIndex]),
          onWillPop: _onWillPop),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              tipe == 'Petani'? Icons.upload_sharp:Icons.confirmation_number
            ),
            title: Text(
              tipe == 'Petani'? 'Upload':'Transaksi'
            ),
          ),
         // BottomNavigationBarItem(
         //   icon: Icon(Icons.mail_outline),
         //   title: Text('Toko Saya'),
         // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("home 2")
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.file_upload),
          //     title: Text("Upload")
          // ),
        ],
        elevation: 16,
        unselectedItemColor: const Color(0xFFbdbfbe),
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: colorses.hijauDasar,
        onTap: _onItemTapped,
      ),
    );
  }
}
