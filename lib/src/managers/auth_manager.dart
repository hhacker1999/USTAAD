import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/services/auth_service.dart';
import 'package:project/src/services/firebase_service.dart';

@lazySingleton
class AuthManager {
  final _authService = locator<AuthService>();
  final _firebaseService = locator<FirebaseService>();

  Future<bool> autoSignIn(PhoneAuthCredential cred, String phoneNumber) async {
    var authResult = await _authService.signInWithAuthCredentials(cred);
    var fireResult = await _firebaseService.isUserRegistered(phoneNumber);

    if (authResult && fireResult)
      return true;
    else
      return false;
  }

  Future<bool> otpSignIn(
      String verId, String smsCode, String phoneNumber) async {
    var authResult = await _authService.signInWithSmsCode(verId, smsCode);
    var fireResult = await _firebaseService.isUserRegistered(phoneNumber);

    if (authResult && fireResult)
      return true;
    else
      return false;
  }
}
