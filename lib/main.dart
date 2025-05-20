import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvp_ff/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <- necessario prima di async init
  await dotenv.load(); // carica .env
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: dotenv.env['APP_TITLE'] ?? 'Flutter App',
      theme: ThemeData(
        primaryColor: Color(
          int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF4CAF50'),
        ),
      ),
      home: const LandingPage(),
    );
  }
}
