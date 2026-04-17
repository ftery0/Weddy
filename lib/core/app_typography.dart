import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  // ── Display ────────────────────────────────────────────────────────────────
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 96,
        fontWeight: FontWeight.w800,
        letterSpacing: 96 * -0.05,
        height: 1.0,
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        letterSpacing: 45 * -0.02,
        height: 1.1,
      );

  // ── Headline ───────────────────────────────────────────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: 32 * -0.02,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        letterSpacing: 24 * -0.02,
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 20 * -0.02,
      );

  // ── Title ──────────────────────────────────────────────────────────────────
  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  // ── Body ───────────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // ── Label ──────────────────────────────────────────────────────────────────
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 14 * 0.05,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 12 * 0.05,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 11 * 0.05,
      );

  // ── TextTheme ──────────────────────────────────────────────────────────────
  static TextTheme get textTheme => TextTheme(
        displayLarge:   displayLarge,
        displayMedium:  displayMedium,
        headlineLarge:  headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall:  headlineSmall,
        titleMedium:    titleMedium,
        titleSmall:     titleSmall,
        bodyLarge:      bodyLarge,
        bodyMedium:     bodyMedium,
        bodySmall:      bodySmall,
        labelLarge:     labelLarge,
        labelMedium:    labelMedium,
        labelSmall:     labelSmall,
      );
}
