import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  static const _key = "0dd286b6-8882-11eb-a9bc-0200cd936042";
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String? _otp;
  Future<bool> requestOtp(String phoneNumber) async {
    _otp = _generateRandomString();

    var response = await Dio()
        .get('https://2factor.in/API/V1/$_key/SMS/$phoneNumber/$_otp');

    String? status = response.data['Status'];
    if (status == 'Success')
      return true;
    else
      print('false');
    return false;
  }

  bool confirmOtp(String otpEntered) {
    print(_otp);
    if (_otp == otpEntered)
      return true;
    else
      return false;
  }

  String _generateRandomString() {
    return List.generate(6, (index) => _chars[Random().nextInt(_chars.length)])
        .join();
  }
}
