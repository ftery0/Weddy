import 'package:flutter/material.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_spacing.dart';

/// 카드 박스 컴포넌트
class CardBox extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final double? padding;
  final EdgeInsets? customPadding;
  final bool shadow;

  const CardBox({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = AppSpacing.radiusLarge,
    this.padding = AppSpacing.cardPadding,
    this.customPadding,
    this.shadow = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // 배경색 기본값
    final bgColor = backgroundColor ?? colors.fill.normal;

    // 여백 계산 (customPadding이 있으면 우선)
    final innerPadding = customPadding ??
        EdgeInsets.all(padding ?? AppSpacing.cardPadding);

    return Container(
      padding: innerPadding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: colors.black.withValues(alpha: 0.08),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
