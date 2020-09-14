import 'package:flutter/material.dart';
import 'package:lelangapp/src/ui/controllerPage.dart';
import 'package:lelangapp/src/ui/login.dart';
import 'package:lelangapp/src/ui/splashScreen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LelangApp',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(body: SplashScreen()),
        routes: <String, WidgetBuilder>{
          '/controllPage':(BuildContext context)=> new ControllerPage(),
          '/login':(BuildContext context)=> new Login(),
        }
    );
  }
}