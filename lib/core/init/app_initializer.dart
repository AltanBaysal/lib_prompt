import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Add any other initialization here provided by the guide (Firebase, Storage etc if needed later)
    // For now, just setting preferred orientations or system UI styles could go here.

    // Example: Transparent status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
