import 'package:flutter/material.dart';

import '../auth/presentaion/auth_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/startup/presentation/startup_page.dart';

Route<T> routes<T>(RouteSettings settings) {
  final name = settings.name;
  if (name == "home") {
    return MaterialPageRoute(
      builder: (_) {
        return const HomePage();
      },
    );
  } else if (name == "login") {
    return MaterialPageRoute(
      builder: (_) {
        return const AuthPage();
      },
    );
  } else {
    return MaterialPageRoute(
      builder: (_) {
        return const StartupPage();
      },
    );
  }
}
