import 'package:auth_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';

import '../../../auth/domain/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signOut() {
    context.signOut<UserModel>();
  }

  void _updateUser() {
    context.updateAccount<UserModel>({
      UserKeys.i.biometric: true,
    });
  }

  void _showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  void _showLoading(BuildContext context, bool loading) {}

  void _status(BuildContext context, AuthState state, UserModel? value) {
    if (state.isUnauthenticated) {
      Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AuthObserver<UserModel>(
          onError: _showSnackBar,
          onMessage: _showSnackBar,
          onLoading: _showLoading,
          onStatus: _status,
          child: AuthConsumer<UserModel>(
            builder: (context, value) {
              return Container(
                padding: const EdgeInsets.all(32),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: value?.photo == null
                          ? null
                          : Image.network(
                              value?.photo ?? "",
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      value?.name ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      value?.email ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Account created at ".join(value?.realtime ?? ""),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _updateUser,
                        child: const Text("Update"),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _signOut,
                        child: const Text("Logout"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
