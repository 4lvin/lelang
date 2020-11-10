
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:toast/toast.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _id;
  String _telp;
  String _token;
  int term;

  _authCheckSession(String id, String token) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
//        signInBloc.checkSession(id, token);
//        signInBloc.sessionCheck.listen((onData){
//          if(onData.status == true){
//            setFileKtp(onData.data.filektp);
//            setFilePic(onData.data.filePic);
//            Navigator.pushReplacementNamed(context, '/controllerPage');
//          }else{
//            Navigator.pushReplacementNamed(context, '/loginPage');
//          }
//        }).onError((e){
//          Toast.show(e.toString(), context,
//              duration: 7, gravity: Toast.BOTTOM);
//        });
      }
    } on SocketException catch (_) {
      Toast.show("Cek Internet Anda", context,
          duration: 7, gravity: Toast.BOTTOM);
    }
  }

  _authCheck(String id, String token){
    if(_id == null && _telp == null && _token == null){
      Navigator.pushReplacementNamed(context, '/loginPage');
    } else{
      _authCheckSession(id, token);
    }
  }

  @override
  void initState() {
//    getId().then((onValue) {
//      setState(() {
//        _id = onValue.toString();
//      });
//    });
//    getTelp().then((onValue) {
//      setState(() {
//        _telp = onValue.toString();
//      });
//    });
//    getToken().then((onValue) {
//      setState(() {
//        _token = onValue.toString();
//      });
//    });
//    getTerm().then((onValue){
//      setState(() {
//        term = onValue;
//      });
//    });
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, '/login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colorses.gradient
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 180,
                height: 180,
                child: Image.asset("assets/logoudang.png"),
              ),
              SizedBox(height: 100,),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
