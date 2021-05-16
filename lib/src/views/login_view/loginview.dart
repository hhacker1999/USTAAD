import 'package:flutter/material.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/views/login_view/login_view_model.dart';

class LoginView extends StatelessWidget {
  final _viewModel = locator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<bool>(
              stream: _viewModel.shouldEnterOtpStream,
              initialData: false,
              builder: (_, snap) => TextField(
                onChanged: (c) => snap.data! ? _viewModel.smsOtpInput(c) : _viewModel.mobileNumberInput(c),
              ),
            ),
            StreamBuilder<bool>(
              stream: _viewModel.isLoadingStream,
              initialData: false,
              builder: (context, snap) => snap.data!
                  ? CircularProgressIndicator()
                  : StreamBuilder<bool>(
                      stream: _viewModel.shouldEnterOtpStream,
                      initialData: false,
                      builder: (_, snapshot) => ElevatedButton(
                        onPressed: () => !snapshot.data!
                            ? _viewModel.verifyPhoneNumber(context)
                            : _viewModel.otpSignIn(context),
                        child: !snapshot.data! ? Text('Enter Mobile Number'): Text('Enter Otp'),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

//   Future<void> verifyPhone(phoneNo) async {
//     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//       AuthServices().signIn(authResult);
//       print('Logged In');
//     };

//     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//       this.verificationId = verId;
//     };

//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: verified,
//       verificationFailed: (FirebaseAuthException exception) {
//         print(exception.message);
//       },
//       codeAutoRetrievalTimeout: autoTimeout,
//       codeSent: (String verificationId, int? forceResendingToken) {},
//     );
//   }
// }

// class AuthServices {
//   //Handles Auth

//   //Sign out
//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   //SignIn
//   signIn(AuthCredential authCreds) {
//     FirebaseAuth.instance.signInWithCredential(authCreds);
//   }
