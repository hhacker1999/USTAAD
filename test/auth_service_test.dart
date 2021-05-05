import 'package:flutter_test/flutter_test.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/services/auth_service.dart';

void main() {
  configureDependencies();
  AuthService service = locator<AuthService>();

  test('Auth Service test for request otp method', () async {
    var result = await service.requestOtp('8826016289');
    expect(result, true);
  });

  test('Auth service test for otp verification', () async {
    var result = service.confirmOtp('ptQPgG');
    expect(result, true);
  });
}
