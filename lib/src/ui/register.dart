import 'package:flutter/material.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/ui/otpPage.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:lelangapp/src/ui/utils/loading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toast/toast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _nama = TextEditingController();
  var _email = TextEditingController();
  var _telp = TextEditingController();
  var _password = TextEditingController();
  var _rePassword = TextEditingController();
  String selectedStatus = "";
  bool _validate = false;
  bool passwordVisible = true;
  bool rePasswordVisible = true;

  setSelectedStatus(String status) {
    setState(() {
      selectedStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: CustomBackgroundRegis(),
              ),
              Positioned(
                  left: 12,
                  bottom: 90,
                  child: Text(
                    "Registrasi",
                    style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                      style: TextStyle(height: 1),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Nama',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                          ),
                          hintText: 'Nama',
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 12.0),
                          errorText: _nama.text.length < 3 && _validate
                              ? 'Nama harus diisi!'
                              : null),
                      controller: _nama,
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                      style: TextStyle(height: 1),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                          ),
                          hintText: 'Email',
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 12.0),
                          errorText: _email.text.length < 3 && _validate
                              ? 'Email harus diisi!'
                              : null),
                      controller: _email,
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                      style: TextStyle(height: 1),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Telpon',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                          ),
                          hintText: 'Telpon',
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 12.0),
                          errorText: _telp.text.length < 3 && _validate
                              ? 'Telpon harus diisi!'
                              : null),
                      controller: _telp,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Tipe",style: TextStyle(fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: RadioListTile(
                              activeColor: colorses.hijauDasar,
                              value: "Petani",
                              title: Text("Petani"),
                              groupValue: selectedStatus,
                              onChanged: (String val) {
                                setSelectedStatus(val);
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              activeColor: colorses.hijauDasar,
                              value: "Suplier",
                              title: Text("Suplier"),
                              groupValue: selectedStatus,
                              onChanged: (String val) {
                                setSelectedStatus(val);
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                      style: TextStyle(height: 1),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                          ),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible ? Icons.visibility_off : Icons.visibility,
                              color: Theme.of(context).backgroundColor,
                            ),
                            onPressed: () {
                              this.setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 12.0),
                          errorText: _password.text.length < 3 && _validate
                              ? 'Password harus diisi!'
                              : null),
                      controller: _password,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                      style: TextStyle(height: 1),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: 'Konfirmasi Password',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                          ),
                          hintText: 'Konfirmasi Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              rePasswordVisible ? Icons.visibility_off : Icons.visibility,
                              color: Theme.of(context).backgroundColor,
                            ),
                            onPressed: () {
                              this.setState(() {
                                rePasswordVisible = !rePasswordVisible;
                              });
                            },
                          ),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 12.0),
                          errorText: _rePassword.text.length < 3 && _validate
                              ? 'Konfirmasi Password harus diisi!'
                              : null),
                      controller: _rePassword,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Material(
                    shadowColor: Colors.grey[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    elevation: 9.0,
                    child: Container(
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
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onTap: () {
                            if (_nama.text.isEmpty ||
                                _email.text.isEmpty ||
                                _telp.text.isEmpty ||
                                _password.text.isEmpty ||
                                selectedStatus == ""||
                                _rePassword.text.isEmpty) {
                              setState(() {
                                _validate = true;
                              });
                            } else if (_password.text != _rePassword.text) {
                              Toast.show("Password harus sama", context,
                                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                            } else {
                              Dialogs.showLoading(context);
                              blocMember.register(_nama.text, _email.text,
                                  _telp.text, _rePassword.text, selectedStatus);
                              blocMember.resRegister.listen((value) {
                                if (value.status == true) {
                                  Dialogs.dismiss(context);
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: OtpPage(email: _email.text)));
                                } else {
                                  Dialogs.dismiss(context);
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Toast.show("Registrasi Gagal", context,
                                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                                }
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 70,
                            height: 50,
                            child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
