import 'package:auth_management/core.dart';
import 'package:flutter/material.dart';

import '../domain/user.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          SizedBox(
            width: double.infinity,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: signInByApple,
                  child: const Text("Apple"),
                ),
                ElevatedButton(
                  onPressed: signInByGoogle,
                  child: const Text("Google"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signInByApple() {
    context.signInByApple<UserModel>();
  }

  void signInByGoogle() {
    context.signInByGoogle<UserModel>();
  }
}
