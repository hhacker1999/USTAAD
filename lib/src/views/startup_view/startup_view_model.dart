import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:project/src/app/app_constants.dart';
import 'package:project/src/app/app_navigator.dart';
import 'package:project/src/app/locator.dart';

@lazySingleton
class StartUpViewModel {
  final _navigator = locator<AppNavigator>();

  Future operations() async {
    await Firebase.initializeApp();
    await Future.delayed(Duration(seconds: 10));
    _navigator.navigateAndPop(AppConstants.loginView);
  }
}
