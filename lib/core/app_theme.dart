import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weddy/core/app_palette.dart';
import 'package:weddy/core/app_typography.dart';

// ── Color group sub-tokens

@immutable
class WeddyPrimary {
  const WeddyPrimary({required this.strong, required this.normal, required this.alternative, required this.assistive});
  final Color strong, normal, alternative, assistive;
}

@immutable
class WeddyLabel {
  const WeddyLabel({required this.strong, required this.normal, required this.neutral, required this.alternative, required this.assistive, required this.disable});
  final Color strong, normal, neutral, alternative, assistive, disable;
}

@immutable
class WeddyLine {
  const WeddyLine({required this.normal, required this.neutral, required this.alternative});
  final Color normal, neutral, alternative;
}

@immutable
class WeddyFill {
  const WeddyFill({required this.normal, required this.neutral, required this.alternative});
  final Color normal, neutral, alternative;
}

@immutable
class WeddyBackground {
  const WeddyBackground({required this.normal, required this.neutral, required this.alternative});
  final Color normal, neutral, alternative;
}

@immutable
class WeddyStatus {
  const WeddyStatus({required this.negative, required this.cautionary, required this.positive});
  final Color negative, cautionary, positive;
}

// ── Semantic color tokens

@immutable
class WeddyColors extends ThemeExtension<WeddyColors> {
  const WeddyColors({
    required this.primary,
    required this.label,
    required this.line,
    required this.fill,
    required this.background,
    required this.status,
    required this.white,
    required this.black,
  });

  final WeddyPrimary    primary;
  final WeddyLabel      label;
  final WeddyLine       line;
  final WeddyFill       fill;
  final WeddyBackground background;
  final WeddyStatus     status;
  final Color           white, black;

  static const light = WeddyColors(
    primary:    WeddyPrimary(strong: AppPalette.sky500, normal: AppPalette.sky300, alternative: AppPalette.sky100, assistive: AppPalette.sky50a40),
    label:      WeddyLabel(strong: AppPalette.black, normal: AppPalette.gray800, neutral: AppPalette.gray700, alternative: AppPalette.gray600, assistive: AppPalette.gray500, disable: AppPalette.gray400),
    line:       WeddyLine(normal: AppPalette.gray400, neutral: AppPalette.gray300, alternative: AppPalette.gray200),
    fill:       WeddyFill(normal: AppPalette.white, neutral: AppPalette.gray100, alternative: AppPalette.gray75),
    background: WeddyBackground(normal: AppPalette.gray150, neutral: AppPalette.gray50, alternative: AppPalette.gray100),
    status:     WeddyStatus(negative: AppPalette.red400, cautionary: AppPalette.amber400, positive: AppPalette.green400),
    white: AppPalette.white,
    black: AppPalette.black,
  );

  static const dark = WeddyColors(
    primary:    WeddyPrimary(strong: AppPalette.sky200, normal: AppPalette.sky300, alternative: AppPalette.sky400, assistive: AppPalette.sky50a10),
    label:      WeddyLabel(strong: AppPalette.white, normal: AppPalette.gray200, neutral: AppPalette.dark800, alternative: AppPalette.dark700, assistive: AppPalette.dark600, disable: AppPalette.dark500),
    line:       WeddyLine(normal: AppPalette.dark450, neutral: AppPalette.dark400, alternative: AppPalette.dark300),
    fill:       WeddyFill(normal: AppPalette.dark350, neutral: AppPalette.dark300, alternative: AppPalette.dark100),
    background: WeddyBackground(normal: AppPalette.dark200, neutral: AppPalette.dark150, alternative: AppPalette.dark50),
    status:     WeddyStatus(negative: AppPalette.red500, cautionary: AppPalette.amber500, positive: AppPalette.green500),
    white: AppPalette.white,
    black: AppPalette.black,
  );

  @override
  WeddyColors copyWith({
    WeddyPrimary? primary, WeddyLabel? label, WeddyLine? line,
    WeddyFill? fill, WeddyBackground? background, WeddyStatus? status,
    Color? white, Color? black,
  }) => WeddyColors(
    primary:    primary    ?? this.primary,
    label:      label      ?? this.label,
    line:       line       ?? this.line,
    fill:       fill       ?? this.fill,
    background: background ?? this.background,
    status:     status     ?? this.status,
    white:      white      ?? this.white,
    black:      black      ?? this.black,
  );

  @override
  WeddyColors lerp(WeddyColors? other, double t) => t < 0.5 ? this : other ?? this;
}

/// `context.colors.primary.normal` 형태로 바로 접근
extension WeddyColorsX on BuildContext {
  WeddyColors get colors => Theme.of(this).extension<WeddyColors>()!;
}

// ── ThemeData builder

class AppTheme {
  const AppTheme._();

  static ThemeData get light => _build(WeddyColors.light, Brightness.light);
  static ThemeData get dark  => _build(WeddyColors.dark,  Brightness.dark);

  static ThemeData _build(WeddyColors c, Brightness brightness) => ThemeData(
    useMaterial3: true,
    extensions: [c],
    scaffoldBackgroundColor: c.background.neutral,
    textTheme: AppTypography.textTheme,
    colorScheme: ColorScheme(
      brightness:           brightness,
      primary:              c.primary.normal,
      onPrimary:            c.white,
      primaryContainer:     c.primary.alternative,
      onPrimaryContainer:   c.label.neutral,
      secondary:            c.primary.normal,
      onSecondary:          c.white,
      secondaryContainer:   c.primary.alternative,
      onSecondaryContainer: c.label.neutral,
      error:                c.status.negative,
      onError:              c.white,
      surface:              c.background.neutral,
      onSurface:            c.label.normal,
      onSurfaceVariant:     c.label.alternative,
      outline:              c.line.normal,
      outlineVariant:       c.line.neutral,
      shadow:               c.black,
      scrim:                c.black,
      inverseSurface:       c.label.normal,
      onInverseSurface:     c.background.neutral,
      inversePrimary:       c.primary.alternative,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor:     c.background.neutral,
      foregroundColor:     c.label.normal,
      elevation:           0,
      scrolledUnderElevation: 0,
      systemOverlayStyle:  brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
    ),
    iconTheme: IconThemeData(color: c.label.alternative),
  );
}
