import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: tDarkColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w600, color: tDarkColor),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w600, color: tDarkColor),
    headlineMedium: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: tDarkColor),
    titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: tDarkColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: tDarkColor),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: tDarkColor),
    bodySmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.normal, color: tDarkColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: tWhiteColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: tWhiteColor),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: tWhiteColor),
    headlineMedium: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    bodySmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.normal, color: tWhiteColor),

  );
}