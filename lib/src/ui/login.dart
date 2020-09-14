import 'package:flutter/material.dart';
import 'package:lelangapp/src/bloc/memberBloc.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/register.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:lelangapp/src/ui/utils/loading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _email = TextEditingController();
  var _password = TextEditingController();
  bool _validate = false;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: CustomBackground(),
                ),
                Positioned(
                    left: 12,
                    bottom: 90,
                    child: Text(
                      "Selamat\nDatang",
                      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
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
                        ? 'Jumlah Pinjaman harus diisi!'
                        : null),
                controller: _email,
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
                        ? 'Jumlah Pinjaman harus diisi!'
                        : null),
                controller: _password,
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
                      if (_email.text.isEmpty || _password.text.isEmpty) {
                        setState(() {
                          _validate = true;
                        });
                      } else {
                        Dialogs.showLoading(context);
                        blocMember.login(_email.text, _password.text);
                        blocMember.resLogin.listen((value) {
                          if (value.status == true) {
                            Dialogs.dismiss(context);
                            setToken(value.data.idToken);
                            setKdUser(value.data.kdUser);
                            setEmail(_email.text);
                            setNama(value.data.nama);
                            setTelp(value.data.telpon);
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/controllPage', (Route<dynamic> route) => false);
                          } else {
                            Dialogs.dismiss(context);
                            FocusScope.of(context).requestFocus(new FocusNode());
                            Toast.show("User atau Password salah!", context,
                                duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                          }
                        });
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 70,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18,),
            Material(
              shadowColor: Colors.grey[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              elevation: 9.0,
              child: Container(
                decoration: BoxDecoration(
                  color: colorses.merahLight,
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
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              child: Register()));
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
    );
  }
}
