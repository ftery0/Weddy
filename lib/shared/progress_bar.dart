import 'package:flutter/material.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/core/app_theme.dart';

/// 단순 수평 프로그래스 바.
class ProgressBar extends StatelessWidget {
  final double value;
  final double height;

  const ProgressBar({
    super.key,
    required this.value,
    this.height = 6,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: colors.fill.neutral), 
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: value.clamp(0.0, 1.0),
                child: Container(color: colors.primary.normal), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
