// lib/core/presentation/design_system/tokens/typography_tokens.dart
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class DSTypography {
  DSTypography._();

  static TextTheme textTheme = TextTheme(
    // Headings
    displayLarge: GoogleFonts.nunito(
      fontSize: 47.78,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),
    displayMedium: GoogleFonts.nunito(
      fontSize: 39.81,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),
    displaySmall: GoogleFonts.nunito(
      fontSize: 33.18,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),
    headlineMedium: GoogleFonts.nunito(
      fontSize: 27.65,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),

    // Titles
    titleLarge: GoogleFonts.nunito(
      fontSize: 25,
      fontWeight: FontWeight.w300,
      height: 1.25,
      letterSpacing: 2.0,
    ),
    // Overline (sin subrayado)
    titleMedium: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.25,
      letterSpacing: .6,
    ),
    // Menú
    titleSmall: GoogleFonts.nunito(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      height: 1.25,
      letterSpacing: .4,
    ),
    // Filtros

    // Body
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      height: 1.35,
      letterSpacing: .32,
      decoration: TextDecoration.underline,
    ),
    // Input… (subrayado aquí)
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1.30,
      letterSpacing: .28,
    ),
    // Labels
    bodySmall: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.35,
      letterSpacing: .24,
    ),
    // Tablas

    // Labels
    labelLarge: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 1.30,
      letterSpacing: .28,
    ),
    // Botón
    labelSmall: GoogleFonts.nunito(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 1.40,
      letterSpacing: .20,
    ), // Paragraph
  );
}
