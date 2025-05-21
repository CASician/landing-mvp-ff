import 'package:flutter/material.dart';
import 'package:mvp_ff/landing_page.dart';

import 'env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <- necessario prima di async init
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.appTitle,
      theme: ThemeData(
        primaryColor: Env.primaryColor,
      ),
      home: const LandingPage(),
    );
  }
}
