import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAutomaticallywithPhoneNumber(String phoneNumber) async {
    var authResult;
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (c) => _signIn,
          verificationFailed: (e) => throw Exception(e),
          codeSent: (v, t) => authResult = {'verId': v, 'token': t},
          codeAutoRetrievalTimeout: (v) => authResult = {'verId': v});
      return authResult;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _signIn(AuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signInwithOtp(String verId, String code) async {
    var creds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: code);
    await _signIn(creds);
  }
}
