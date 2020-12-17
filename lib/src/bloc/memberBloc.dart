import 'package:lelangapp/src/models/getCheckOtpModel.dart';
import 'package:lelangapp/src/models/getLelangDetailModel.dart';
import 'package:lelangapp/src/models/getListLelangPetani.dart';
import 'package:lelangapp/src/models/getLoginModel.dart';
import 'package:lelangapp/src/models/getRegisterModel.dart';
import 'package:lelangapp/src/models/listlelangaktif.dart';
import 'package:lelangapp/src/models/listransaksisuplier.dart';
import 'package:lelangapp/src/models/postLelang.dart';
import 'package:lelangapp/src/models/postNgebit.dart';
import 'package:lelangapp/src/resources/repositories.dart';
import 'package:rxdart/rxdart.dart';

class MemberBloc {
  final _repository = Repositories();
  final _registerFetcher = PublishSubject<GetRegisterModel>();
  final _loginFetcher = PublishSubject<GetLoginModel>();
  final _otpFetcher = PublishSubject<GetCheckOtpModel>();
  final _listLelangFetcher = PublishSubject<Getlistlelangpetani>();
  final _detailLelang = PublishSubject<Getdetailelang>();
  final _postlelangFetcher = PublishSubject<Postlelang>();
  final _listLelangAktifFetcher = PublishSubject<Lelangaktif>();
  final _postBitFetcher = PublishSubject<Ngebit>();
  final _listbitsuplierFetcher = PublishSubject<ListBitSuplier>();

  PublishSubject<GetRegisterModel> get resRegister => _registerFetcher.stream;

  PublishSubject<GetLoginModel> get resLogin => _loginFetcher.stream;

  PublishSubject<GetCheckOtpModel> get resOtp => _otpFetcher.stream;

  PublishSubject<Getlistlelangpetani> get listLelang => _listLelangFetcher.stream;

  PublishSubject<Getdetailelang> get detailLelang => _detailLelang.stream;

  PublishSubject<Postlelang> get ResPostLelang => _postlelangFetcher.stream;

  PublishSubject<Lelangaktif> get ResLelangAktif => _listLelangAktifFetcher.stream;

  PublishSubject<Ngebit> get ResPostBit => _postBitFetcher.stream;

  PublishSubject<ListBitSuplier> get ResListBitSuplier => _listbitsuplierFetcher.stream;

  register(
      String nama, String email, String telp, String pass, String tipe) async {
    GetRegisterModel getRegisterModel =
        await _repository.register(nama, email, telp, pass, tipe);
    _registerFetcher.sink.add(getRegisterModel);
  }

  login(String email, String password) async {
    GetLoginModel getLoginModel = await _repository.login(email, password);
    _loginFetcher.sink.add(getLoginModel);
  }

  checkOtp(String email, String otp) async {
    GetCheckOtpModel getCheckOtpModel = await _repository.checkOtp(email, otp);
    _otpFetcher.sink.add(getCheckOtpModel);
  }

  listlelangpetani(String id) async {
    Getlistlelangpetani getlistlelangpetani = await _repository.getLIstLelang(id);
    _listLelangFetcher.sink.add(getlistlelangpetani);
  }

  DetailLelang(String id) async {
    Getdetailelang getdetailelang = await _repository.DetailLelang(id);
    _detailLelang.sink.add(getdetailelang);
  }

  PostLelang(String username, String image, String panen,String judul,String ukuranproduk,String harga,String timbangan,String lokasi,String jenis, String deskripsi, String berat) async {
    Postlelang respostlelang = await _repository.resPostLelang(username, image, panen, judul, ukuranproduk, harga, timbangan, lokasi, jenis, deskripsi, berat);
    _postlelangFetcher.sink.add(respostlelang);
  }

  GetLelangAktif() async {
    Lelangaktif reslelangaktif = await _repository.resLelangAkif();
    _listLelangAktifFetcher.sink.add(reslelangaktif);
  }

  PostBit(String Username, String id, String nominal) async {
    Ngebit resBit = await _repository.resPostBit(Username, id, nominal);
    _postBitFetcher.sink.add(resBit);
  }

  GetBitSuplier(String Username) async {
    ListBitSuplier res = await _repository.resListBitSuplier(Username);
    _listbitsuplierFetcher.sink.add(res);
  }

  dispose() {
    _registerFetcher.close();
    _loginFetcher.close();
    _otpFetcher.close();
    _listLelangFetcher.close();
    _detailLelang.close();
    _postlelangFetcher.close();
    _listLelangAktifFetcher.close();
    _postBitFetcher.close();
    _listbitsuplierFetcher.close();
  }
}

final blocMember = MemberBloc();
