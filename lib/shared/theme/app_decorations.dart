import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

///
/// 규칙:
/// - 카드에 드롭 섀도우 없음 — 색상 변화로 깊이 표현 (Tonal Lift)
/// - 부유 요소 → Glass 효과 (80% 불투명도 + 20px 블러)
/// - Ambient 섀도우: onSurface @ 4% 불투명도, 블러 40–60px, 확산 -5px
/// - Ghost Border: outlineVariant @ 15% 불투명도 (최후의 수단만)
abstract class AppDecorations {
  // ── 카드 (Tonal Lift) ──────────────────────────────────────────────────────
  /// 표준 인터랙티브 카드 — surfaceContainerLowest가 surface 위에 떠오름
  static const BoxDecoration card = BoxDecoration(
    color: AppColors.surfaceContainerLowest,
    borderRadius: BorderRadius.all(Radius.circular(AppSpacing.radiusLarge)),
  );

  /// 섹션 배경 — surface보다 한 단계 위 (테두리 없음, 그림자 없음)
  static const BoxDecoration section = BoxDecoration(
    color: AppColors.surfaceContainerLow,
    borderRadius: BorderRadius.all(Radius.circular(AppSpacing.radiusLarge)),
  );

  // ── Glass (높은 고도 / 부유 요소) ────────────────────────────────────
  /// UI 위에 부유하는 요소 (BottomSheet, 오버레이)
  static BoxDecoration glass({
    double opacity = 0.80,
    double radius = AppSpacing.radiusLarge,
  }) =>
      BoxDecoration(
        color: AppColors.surfaceContainerLowest.withValues(alpha: opacity),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      );

  // ── Ambient 섀도우 ───────────────────────────────────────────────────────
  /// 부드러운 대기 글로우 — 모달, 토스트, 진정한 부유 요소만
  static List<BoxShadow> get ambientShadow => [
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.04),
          blurRadius: 50,
          spreadRadius: -5,
        ),
      ];

  // ── Ghost Border ───────────────────────────────────────────────────────────
  /// 고휘도 환경용 폴백 경계 — 최대 15% 불투명도
  static BoxDecoration ghostBorder({
    double radius = AppSpacing.radiusLarge,
  }) =>
      BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.15),
          width: 1,
        ),
      );

  // ── Primary 그라디언트 ────────────────────────────────────────────────
  /// CTA 그라디언트 — primary (#2B6579) → primaryContainer (#A0D8EF) @ 135°
  /// DESIGN.md: "Primary CTA에 단색 채우기 사용 금지."
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight, // ~135°
    colors: [AppColors.primary, AppColors.primaryContainer],
  );

  /// Primary 버튼 / 영웅 배경용 그라디언트 데코레이션
  static BoxDecoration primaryGradientBox({
    double radius = AppSpacing.radiusFull,
  }) =>
      BoxDecoration(
        gradient: primaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      );

  // ── Atmospheric 칩 ─────────────────────────────────────────────────────
  /// "서리 낀 하늘" 칩 — 반투명 primaryContainer @ 20% 불투명도
  static BoxDecoration get atmosphericChip => BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.20),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSpacing.radiusFull),
        ),
      );

  // ── Active 네비게이션 항목 ───────────────────────────────────────────
  static const BoxDecoration activeNavItem = BoxDecoration(
    color: AppColors.primaryContainer,
    borderRadius: BorderRadius.all(Radius.circular(AppSpacing.radiusLarge)),
  );
}
