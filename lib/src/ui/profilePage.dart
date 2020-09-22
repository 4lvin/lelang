import 'package:flutter/material.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/dialogAlert/sweetDialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Profil"),),
          InkWell(
            onTap: (){
              _confirmExit();
            },
            child: Container(
              //width: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colorses().merahLight,
                  borderRadius: BorderRadius.circular(14)
              ),
              child: Center(child: Text("Keluar",style: TextStyle(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }

  _confirmExit() {
    SweetAlert.show(context,
        title: "Konfirmasi",
        subtitle: Center(child: Text("Apakah Anda yakin akan keluar?")),
        style: SweetAlertStyle.confirm,
//        cancelButtonColor: Color(0xffababab),
        cancelButtonText: "Tidak",
        confirmButtonText: "YA",
        confirmButtonColor: Color(0xff96d873),
        showCancelButton: true, onPress: (bool isConfirm) {
          if (isConfirm) {
            rmvToken();
            rmvEmail();
            rmvNama();
            rmvKdUser();
            rmvTipe();
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/login');
            return false;
          }
        });
  }
}
