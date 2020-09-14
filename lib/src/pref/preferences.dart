import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("token", value);
}
Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("token");
}
Future rmvToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("token");
}

Future setKdUser(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("kduser", value);
}
Future getKdUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("kduser");
}
Future rmvKdUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("kduser");
}

Future setEmail(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("email", value);
}
Future getEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("email");
}
Future rmvEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("email");
}

Future setNama(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("nama", value);
}
Future getNama() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("nama");
}
Future rmvNama() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("nama");
}

Future setTelp(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("telp", value);
}
Future getTelp() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("telp");
}
Future rmvTelp() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("telp");
}