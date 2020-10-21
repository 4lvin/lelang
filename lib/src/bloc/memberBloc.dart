import 'package:lelangapp/src/models/getCheckOtpModel.dart';
import 'package:lelangapp/src/models/getLelangDetailModel.dart';
import 'package:lelangapp/src/models/getListLelangPetani.dart';
import 'package:lelangapp/src/models/getLoginModel.dart';
import 'package:lelangapp/src/models/getRegisterModel.dart';
import 'package:lelangapp/src/resources/repositories.dart';
import 'package:rxdart/rxdart.dart';

class MemberBloc {
  final _repository = Repositories();
  final _registerFetcher = PublishSubject<GetRegisterModel>();
  final _loginFetcher = PublishSubject<GetLoginModel>();
  final _otpFetcher = PublishSubject<GetCheckOtpModel>();
  final _listLelangFetcher = PublishSubject<Getlistlelangpetani>();
  final _detailLelang = PublishSubject<Getdetailelang>();

  PublishSubject<GetRegisterModel> get resRegister => _registerFetcher.stream;

  PublishSubject<GetLoginModel> get resLogin => _loginFetcher.stream;

  PublishSubject<GetCheckOtpModel> get resOtp => _otpFetcher.stream;

  PublishSubject<Getlistlelangpetani> get listLelang => _listLelangFetcher.stream;

  PublishSubject<Getdetailelang> get detailLelang => _detailLelang.stream;

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

  dispose() {
    _registerFetcher.close();
    _loginFetcher.close();
    _otpFetcher.close();
    _listLelangFetcher.close();
    _detailLelang.close();
  }
}

final blocMember = MemberBloc();
