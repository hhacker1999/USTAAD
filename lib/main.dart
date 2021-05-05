import 'package:flutter/material.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/views/homeview/homeview.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
