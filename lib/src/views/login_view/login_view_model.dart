import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/managers/auth_manager.dart';
import 'package:project/src/views/homeview/homeview.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class LoginViewModel {
  final _authManager = locator<AuthManager>();
  final _shouldEnterOtp = BehaviorSubject<bool>.seeded(false);
  final _mobileNumberInput = BehaviorSubject<String>();
  final _smsOtpInput = BehaviorSubject<String>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  late String _verId;
  late int _resendToken;

  //Inputs
  void mobileNumberInput(String c) => _mobileNumberInput.sink.add(c);
  void smsOtpInput(String c) => _smsOtpInput.sink.add(c);

  //ValueStreams
  ValueStream<String> get mobileNumberStream => _mobileNumberInput.stream;
  ValueStream<String> get smsOtpStream => _smsOtpInput.stream;
  ValueStream<bool> get isLoadingStream => _isLoading.stream;
  ValueStream<bool> get shouldEnterOtpStream => _shouldEnterOtp.stream;

  Future<void> autoSignIn(
      PhoneAuthCredential credential, BuildContext context) async {
    var result =
        await _authManager.autoSignIn(credential, mobileNumberStream.value!);
    if (result == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      _isLoading.sink.add(false);
    }
  }

  Future<void> otpSignIn(BuildContext context) async {
    _isLoading.sink.add(true);
    var result = await _authManager.otpSignIn(
        _verId, smsOtpStream.value!, mobileNumberStream.value!);
    if (result == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    }
  }

  Future<void> verifyPhoneNumber(BuildContext context) async {
    _isLoading.sink.add(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumberStream.value!,
        verificationCompleted: (a) => autoSignIn(a, context),
        verificationFailed: (a) {
          print(a.code);
        },
        codeSent: (a, c) {
          _verId = a;
          _resendToken = c!;
          _shouldEnterOtp.sink.add(true);
        },
        codeAutoRetrievalTimeout: (a) {});
  }

  @disposeMethod
  void dispose() {
    _mobileNumberInput.close();
    _smsOtpInput.close();
    _isLoading.close();
    _shouldEnterOtp.close();
  }
}
