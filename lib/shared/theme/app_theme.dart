import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';

///
/// Material 3 ColorScheme이 AppColors 토큰과 직접 매핑되어
/// 모든 기본 Flutter 위젯이 "Atmospheric Minimalism" 팔레트를 따릅니다.
class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme = const ColorScheme(
      brightness: Brightness.light,

      // ── Primary / 주요 색상
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,

      // ── Secondary / 보조 색상 — 단일 악센트 시스템이므로 Primary를 따름
      secondary: AppColors.primary,
      onSecondary: AppColors.onPrimary,
      secondaryContainer: AppColors.primaryContainer,
      onSecondaryContainer: AppColors.onPrimaryContainer,

      // ── Tertiary / 세부 악센트 — 브랜드 블루
      tertiary: AppColors.brandBlue,
      onTertiary: AppColors.onPrimary,
      tertiaryContainer: AppColors.surfaceContainerLow,
      onTertiaryContainer: AppColors.onSurface,

      // ── Error / 에러
      error: AppColors.error,
      onError: AppColors.onPrimary,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),

      // ── Surfaces / Surface 계층 — 5단계 계층 구조
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      onSurfaceVariant: AppColors.onSurfaceVariant,
      surfaceContainerLowest: AppColors.surfaceContainerLowest,
      surfaceContainerLow: AppColors.surfaceContainerLow,
      surfaceContainer: AppColors.surfaceContainer,
      surfaceContainerHigh: AppColors.surfaceContainerHighest,
      surfaceContainerHighest: AppColors.surfaceContainerHighest,

      // ── Outline / 아웃라인 — Ghost Border 시스템
      outline: Color(0x26404840), // outlineVariant @ 15% 불투명도
      outlineVariant: Color(0x26404840),

      // ── Inverse / 역상
      inverseSurface: AppColors.onSurface,
      onInverseSurface: AppColors.surface,
      inversePrimary: AppColors.primaryContainer,

      // ── Scrim / 그림자 색조
      scrim: AppColors.onSurface,
      shadow: AppColors.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surface,
      textTheme: AppTypography.textTheme,

      // ── AppBar ────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTypography.headlineMedium,
        toolbarHeight: 64,
      ),

      // ── 카드 — Tonal Lift, 그림자 없음 ──────────────────────────────
      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Elevated 버튼 — 그라디언트 CTA ─────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          foregroundColor: const WidgetStatePropertyAll(AppColors.onPrimary),
          elevation: const WidgetStatePropertyAll(0),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSpacing.radiusFull),
              ),
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTypography.titleSmall),
        ),
      ),

      // ── Outlined 버튼 — 보조 스타일 ──────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(
            AppColors.primaryContainer,
          ),
          foregroundColor: const WidgetStatePropertyAll(
            AppColors.onPrimaryContainer,
          ),
          elevation: const WidgetStatePropertyAll(0),
          side: const WidgetStatePropertyAll(BorderSide.none),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSpacing.radiusFull),
              ),
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTypography.titleSmall),
        ),
      ),

      // ── Text 버튼 — Tertiary 스타일 ────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(AppColors.primary),
          textStyle: WidgetStatePropertyAll(AppTypography.titleSmall),
        ),
      ),

      // ── 입력 필드 — 미니멀 soft-filled ─────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          borderSide: const BorderSide(
            color: AppColors.primaryContainer,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),

      // ── 칩 — Atmospheric "서리 낀 하늘" ──────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.primaryContainer.withValues(alpha: 0.20),
        labelStyle: AppTypography.labelMedium.copyWith(
          color: AppColors.onPrimaryContainer,
        ),
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.radiusFull),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),

      // ── Bottom Navigation / 하단 네비게이션 ────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surfaceContainerLowest,
        indicatorColor: AppColors.primaryContainer,
        labelTextStyle: WidgetStatePropertyAll(AppTypography.labelSmall),
        iconTheme: const WidgetStatePropertyAll(
          IconThemeData(color: AppColors.onSurfaceVariant),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),

      // ── Divider / 구분선 — "No-Line" 규칙: 1px 라인 아님, 4px 높이 바 ──
      dividerTheme: const DividerThemeData(
        color: AppColors.surfaceContainerLow,
        thickness: 4,
        space: 0,
      ),

      // ── 아이콘 기본값 ───────────────────────────────────────────────
      iconTheme: const IconThemeData(color: AppColors.onSurfaceVariant),
    );
  }
}
