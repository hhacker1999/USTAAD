import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      home: StartUpView(),
    );
  }
}
