import 'package:flutter/material.dart';

import 'homepage/homepage.dart';
import 'login/login.dart';
import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initialRoute});

  static const String _title = 'EURELINK';
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      routes: {
        // '/': (context) =>  checkIfLoggedIn() ? const HomePage() : const LoginPage(),
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
