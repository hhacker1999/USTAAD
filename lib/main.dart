import 'package:flutter/material.dart';
import 'package:project/src/app/app_constants.dart';
import 'package:project/src/app/app_navigator.dart';
import 'package:project/src/app/app_router.dart' as router;
import 'package:project/src/app/locator.dart';
import 'package:project/src/views/startup_view/startup_view.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoutes,
      navigatorKey: AppNavigator.key,
      debugShowCheckedModeBanner: false,
      initialRoute: AppConstants.startUpView,
    );
  }
}
