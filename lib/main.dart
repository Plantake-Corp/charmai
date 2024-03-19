import 'package:rizz/core/app.dart';
import 'package:flutter/material.dart';
import 'package:rizz/core/bootstrap.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const App());
}
