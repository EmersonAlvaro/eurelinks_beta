import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/common/common.dart';
// import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // final _cameras = await availableCameras();
  // final firstCamera = _cameras.first;

  final bool isLogged = await checkIfLoggedIn();
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  final String initialRoute = isLogged ? '/home' : '/';

  runApp(MyApp(initialRoute: initialRoute));
}
