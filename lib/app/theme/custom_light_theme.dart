// ignore_for_file: prefer_typing_uninitialized_variables, type_annotate_public_apis, inference_failure_on_uninitialized_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class CustomLightTheme {
  CustomLightTheme() {
    themeData = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(),
        bodyMedium: GoogleFonts.poppins(),
        bodyLarge: GoogleFonts.poppins(),
        titleSmall: GoogleFonts.poppins(),
        titleMedium: GoogleFonts.poppins(),
        titleLarge: GoogleFonts.poppins(),
        labelSmall: GoogleFonts.poppins(),
        labelMedium: GoogleFonts.poppins(),
        labelLarge: GoogleFonts.poppins(),
        headlineSmall: GoogleFonts.poppins(),
        headlineMedium: GoogleFonts.poppins(),
        headlineLarge: GoogleFonts.poppins(),
      ),
    );
  }
  static ThemeData themeData = ThemeData();
}
