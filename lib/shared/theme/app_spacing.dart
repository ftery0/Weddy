/// "모든 모서리는 ROUND_FULL 또는 최소 1rem(16px).
///  각진 모서리는 절대 금지."
abstract class AppSpacing {
  // ── 여백 스케일 ────────────────────────────────────────────────────────────
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;

  // ── 페이지 레이아웃 ────────────────────────────────────────────────────────
  /// 페이지 좌우 패딩 (Figma 기준: 24px)
  static const double pagePadding = 24;

  /// 카드 내부 패딩
  static const double cardPadding = 24;

  /// 섹션 간 세로 간격
  static const double sectionGap = 32;

  /// 리스트 항목 간 세로 간격 — 구분선 없이 공간으로 구분
  static const double listItemGap = 24;

  // ── 모서리 반지름 ──────────────────────────────────────────────────────────
  /// 버튼, 칩, 알약형 — "ROUND_FULL"
  static const double radiusFull = 9999;

  /// 카드, 시트, 큰 컨테이너 — 1rem
  static const double radiusLarge = 16;

  /// 작은 요소 (배지, 태그)
  static const double radiusSmall = 8;
}
