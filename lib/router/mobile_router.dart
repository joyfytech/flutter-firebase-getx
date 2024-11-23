import 'package:demo_flutter/screens/website/home_screen.dart';
import 'package:demo_flutter/screens/website/login_screen.dart';
import 'package:get/get.dart';

class MobileRouter {
  static const HOME_SCREEN = "/home-screen";

  static const LOGIN_SCREEN = "/login-screen";

  static final routers = [
    GetPage(name: HOME_SCREEN, page: () => HomeScreen()),
    GetPage(name: LOGIN_SCREEN, page: () => LoginScreen())
  ];
}
