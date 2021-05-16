import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppNavigator {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  void navigateTo(String path) {
    key.currentState!.pushNamed(path);
  }

  void navigateAndPop(String path) {
    key.currentState!.pushReplacementNamed(path);
  }

  void goBack() {
    key.currentState!.pop();
  }
}
