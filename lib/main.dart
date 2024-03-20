import 'package:charmai/core/app.dart';
import 'package:charmai/core/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const App());
}
