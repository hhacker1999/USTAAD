import 'package:flutter/material.dart';
import 'package:project/src/app/app_constants.dart';
import 'package:project/src/views/homeview/homeview.dart';
import 'package:project/src/views/login_view/login_view.dart';
import 'package:project/src/views/startup_view/startup_view.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppConstants.startUpView:
      return MaterialPageRoute(builder: (context) => StartUpView());
    case AppConstants.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());
    case AppConstants.homeView:
      return MaterialPageRoute(builder: (context) => HomeView());
    default:
      return MaterialPageRoute(builder: (context) => StartUpView());
  }
}
