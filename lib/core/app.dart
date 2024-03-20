import 'package:auth_management/core.dart';
import 'package:flutter/material.dart';

import '../auth/domain/user.dart';
import '../auth/infrastructures/auth.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthProvider<UserModel>(
      controller: AuthController.getInstance<UserModel>(
        backup: UserBackup(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: routes,
      ),
    );
  }
}
