import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'homepage/homepage.dart';
import 'login/login.dart';
import 'theme/theme.dart';
import 'settings/settings_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initialRoute});

  static const String _title = 'EURELINK';
  final String initialRoute;

  final settings = ValueNotifier(ThemeSettings(
    sourceColor: const Color(0xff00cbe6), // Replace this color
    themeMode: ThemeMode.system,
  ));

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

