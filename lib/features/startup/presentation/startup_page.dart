import 'dart:developer';

import 'package:auth_management/core.dart';
import 'package:flutter/material.dart';

import '../../../auth/domain/user.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  void _showError(BuildContext context, String error) {
    log("AUTH ERROR : $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }

  void _showLoading(BuildContext context, bool loading) {
    log("AUTH LOADING : $loading");
  }

  void _showMessage(BuildContext context, String message) {
    log("AUTH MESSAGE : $message");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _status(BuildContext context, AuthState state, UserModel? value) {
    log("AUTH STATUS : $state");
    if (state.isAuthenticated) {
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    log("STARTUP PAGE");
    return AuthObserver<UserModel>(
      onError: _showError,
      onMessage: _showMessage,
      onLoading: _showLoading,
      onStatus: _status,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
