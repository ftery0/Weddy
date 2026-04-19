import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weddy/core/app_icons.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_typography.dart';
import 'package:weddy/screens/home/models/home_screen_model.dart';
import 'package:weddy/shared/card_box.dart';

class HeroSection extends StatelessWidget {
  final HomeHeroData data;

  const HeroSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth * 0.5;

        return Column(
          children: [
            SizedBox(
              width: iconSize,
              height: iconSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 32,
                        sigmaY: 32,
                        tileMode: TileMode.decal,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.primary.normal.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/weather_partly_cloudy.svg',
                    width: iconSize * 0.58,
                    height: iconSize * 0.54,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // 온도
            Text(
              data.temperature,
              style: AppTypography.displayLarge.copyWith(
                color: colors.label.normal,
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            // 날씨 상태
            Text(
              data.condition,
              style: AppTypography.headlineMedium.copyWith(
                color: colors.label.alternative,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // 하단 통계 pill
            _QuickStatBar(stats: data.quickStats, colors: colors),
          ],
        );
      },
    );
  }
}

class _QuickStatBar extends StatelessWidget {
  final List<HomeQuickStatData> stats;
  final WeddyColors colors;

  const _QuickStatBar({required this.stats, required this.colors});

  @override
  Widget build(BuildContext context) {
    return CardBox(
      borderRadius: AppSpacing.radiusFull,
      customPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(child: _buildStatItem(stats[0])),
          Container(width: 1, height: 34, color: colors.line.alternative),
          Expanded(child: _buildStatItem(stats[1])),
          Container(width: 1, height: 34, color: colors.line.alternative),
          Expanded(child: _buildStatItem(stats[2])),
        ],
      ),
    );
  }

  Widget _buildStatItem(HomeQuickStatData item) {
    final textStyle = AppTypography.titleSmall.copyWith(
      color: colors.label.normal,
      height: 1,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item.icon.toIcon(size: 16, color: colors.primary.normal),
        const SizedBox(width: AppSpacing.md),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            const SizedBox(height: 2),
            Text(
              item.value,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
