import 'package:base_flutter/views/home_view.dart';
import 'package:base_flutter/views/login_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '/';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (_) => const HomeView(),
    '/login': (_) => const LoginView(),
  };
}
