import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/src/app/app_constants.dart';
import 'package:project/src/app/app_navigator.dart';
import 'package:project/src/app/app_router.dart' as router;
import 'package:project/src/app/locator.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
