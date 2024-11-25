import 'package:flutter/material.dart';
import '../view/login_page.dart';

class AppRouter {
  static Route loginPageRoute() {
    return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
