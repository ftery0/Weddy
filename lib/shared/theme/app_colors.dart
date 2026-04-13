import 'package:flutter/material.dart';

/// "Atmospheric Minimalism" 팔레트 (Sky Blue #A0D8EF 중심)
///
/// Surface 계층 (종이의 5단계):
///   surfaceContainerLowest → surfaceContainerLow → surface → surfaceContainer → surfaceContainerHighest
abstract class AppColors {
  // ── Primary ────────────────────────────────────────────────────────────────
  /// 메인 브랜드 / 깊은 틸 — 그라디언트 시작점, 활성 상태 아이콘
  static const Color primary = Color(0xFF2B6579);

  /// 스카이 블루 — 시그니처 악센트, 칩 채우기, 활성 네비게이션 배경
  static const Color primaryContainer = Color(0xFFA0D8EF);

  /// Primary 배경 위의 텍스트
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// PrimaryContainer 배경 위의 텍스트 / 아이콘
  static const Color onPrimaryContainer = Color(0xFF235F73);

  // ── Brand Blue ─────────────────────────────────────────────────────────────
  /// 로고 아이콘, 액션 강조 (Figma: #0059B9)
  static const Color brandBlue = Color(0xFF0059B9);

  // ── Surface 계층 ──────────────────────────────────────────────────────────
  /// 베이스 레이어 — 페이지 배경
  static const Color surface = Color(0xFFF8F9FB);

  /// 섹션 배경 — surface보다 한 단계 위
  static const Color surfaceContainerLow = Color(0xFFF2F4F5);

  /// 헤더 / 그룹화된 배경
  static const Color surfaceContainer = Color(0xFFE8EAEC);

  /// 인터랙티브 카드 — surface 위의 순백 레이어
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);

  /// 내부 요소 (헤더 내 검색창, 들어간 입력필드)
  static const Color surfaceContainerHighest = Color(0xFFDDE1E3);

  // ── On-Surface ─────────────────────────────────────────────────────────────
  /// 주요 텍스트 — 순검은색 사용 금지 ("Atmospheric" 느낌 유지)
  static const Color onSurface = Color(0xFF191C1D);

  /// 보조 텍스트, 라벨, 캡션
  static const Color onSurfaceVariant = Color(0xFF40484C);

  // ── Error ──────────────────────────────────────────────────────────────────
  static const Color error = Color(0xFFBA1A1A);

  // ── Outline ────────────────────────────────────────────────────────────────
  /// Ghost Border 기본색 — 최대 15% 불투명도로 적용 ("No-Line" 규칙)
  static const Color outlineVariant = Color(0xFF40484C);
}
