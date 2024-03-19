import 'package:flutter/material.dart';
import 'package:rizz/auth/presentaion/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const AuthForm(),
    );
  }
}
