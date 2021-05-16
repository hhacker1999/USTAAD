import 'package:flutter/material.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/views/startup_view/startup_view_model.dart';

class StartUpView extends StatefulWidget {
  @override
  _StartUpViewState createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  void initState() {
    locator<StartUpViewModel>().operations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Startup View'),
      ),
    );
  }
}
