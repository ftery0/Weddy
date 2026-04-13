import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

///
/// 규칙:
/// - Display: -0.02em 자간 ("영웅" 순간, 자주 쓰지 않기)
/// - Headlines: 항상 onSurface (#191C1D), 굵고 권위 있게
/// - Labels/Captions: onSurfaceVariant (#40484C) + 0.05em 자간
/// - "사이즈를 건너뛰어 극적 효과 생성" — displayMd와 bodyMd를 바로 연결
abstract class AppTypography {
  // ── Display — 영웅 순간 ─────────────────────────────────────────────────
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 80,
        fontWeight: FontWeight.w700,
        letterSpacing: 80 * -0.02,
        color: AppColors.onSurface,
        height: 1.0,
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        letterSpacing: 45 * -0.02,
        color: AppColors.onSurface,
        height: 1.1,
      );

  // ── Headlines — 권위있는 앵커 ──────────────────────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: 32 * -0.02,
        color: AppColors.onSurface,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        letterSpacing: 24 * -0.02,
        color: AppColors.onSurface,
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 20 * -0.02,
        color: AppColors.onSurface,
      );

  // ── Title ──────────────────────────────────────────────────────────────────
  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      );

  // ── Body ──────────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
        height: 1.5,
      );

  // ── Label / Caption — +0.05em 자간 ─────────────────────────────────────
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 14 * 0.05,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 12 * 0.05,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 11 * 0.05,
        color: AppColors.onSurfaceVariant,
      );

  // ── ThemeData용 TextTheme ──────────────────────────────────────────────
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}
