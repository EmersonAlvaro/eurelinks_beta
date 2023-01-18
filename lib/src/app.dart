import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'homepage/homepage.dart';
import 'login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'EURELINK';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      // home: LoginDemo(),
      home: HomePage(),
    );
  }
}
