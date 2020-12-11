import 'apiProvider.dart';

class Repositories {
  final apiProvider = ApiProviders();

  Future register(
          String nama, String email, String telp, String pass, String tipe) =>
      apiProvider.register(nama, email, telp, pass, tipe);

  Future checkOtp(String email, String otp) => apiProvider.checkOtp(email, otp);

  Future login(String email, String password) =>
      apiProvider.login(email, password);

  Future getLIstLelang(String petani) => apiProvider.getLIstLelang(petani);

  Future DetailLelang(String id) => apiProvider.detailLelang(id);

  Future resPostLelang(String username, String image, String panen,String judul,String ukuranproduk,String harga,String timbangan,String lokasi, String jenis, String deskripsi, String berat)  => apiProvider.postLelang(username, image, panen, judul, ukuranproduk, harga, timbangan, lokasi, jenis, deskripsi, berat);

}
