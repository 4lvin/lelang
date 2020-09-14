import 'apiProvider.dart';

class Repositories {
  final apiProvider = ApiProviders();

  Future register(
          String nama, String email, String telp, String pass, String tipe) =>
      apiProvider.register(nama, email, telp, pass, tipe);

  Future checkOtp(String email, String otp) => apiProvider.checkOtp(email, otp);

  Future login(String email, String password) =>
      apiProvider.login(email, password);
}
