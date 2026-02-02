import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF207fdf);
  static const Color scaffoldBackgroundColor = Color(0xFF000000);
  static const Color surfaceColor = Color(0xFF121212);
  static const Color white = Colors.white;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        surface: scaffoldBackgroundColor,
        onSurface: white,
        onSurfaceVariant: white,
      ),
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: white, displayColor: white),
      useMaterial3: true,
    );
  }
}
