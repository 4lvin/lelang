import 'package:lelangapp/src/models/getCheckOtpModel.dart';
import 'package:lelangapp/src/models/getLoginModel.dart';
import 'package:lelangapp/src/models/getRegisterModel.dart';
import 'package:lelangapp/src/resources/repositories.dart';
import 'package:rxdart/rxdart.dart';

class MemberBloc {
  final _repository = Repositories();
  final _registerFetcher = PublishSubject<GetRegisterModel>();
  final _loginFetcher = PublishSubject<GetLoginModel>();
  final _otpFetcher = PublishSubject<GetCheckOtpModel>();

  PublishSubject<GetRegisterModel> get resRegister => _registerFetcher.stream;

  PublishSubject<GetLoginModel> get resLogin => _loginFetcher.stream;

  PublishSubject<GetCheckOtpModel> get resOtp => _otpFetcher.stream;

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

  dispose() {
    _registerFetcher.close();
    _loginFetcher.close();
    _otpFetcher.close();
  }
}

final blocMember = MemberBloc();
