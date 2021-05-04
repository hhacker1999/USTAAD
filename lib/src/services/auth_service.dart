import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class AuthService {
  static const _key = "0dd286b6-8882-11eb-a9bc-0200cd936042";
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String _otp;
  Future<bool> requestOtp(String phoneNumber) async {
    _otp = _generateRandomString();
    try {
      var response = await http.get(
          Uri.parse('https://2factor.in/API/V1/$_key/SMS/$phoneNumber/$_otp'));
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      String status = decodedResponse['status'];
      if (status == 'success')
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

  bool confirmOtp(String otpEntered) {
    if (_otp == otpEntered)
      return true;
    else
      return false;
  }

  String _generateRandomString() {
    return List.generate(8, (index) => _chars[Random().nextInt(_chars.length)])
        .join();
  }
}
