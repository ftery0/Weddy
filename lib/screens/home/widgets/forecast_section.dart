import 'package:flutter/material.dart';
import 'package:weddy/core/app_icons.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_typography.dart';
import 'package:weddy/screens/home/models/home_screen_model.dart';
import 'package:weddy/shared/card_box.dart';

class ForecastSection extends StatelessWidget {
  final List<HomeForecastDayData> days;

  const ForecastSection({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CardBox(
      borderRadius: AppSpacing.radiusXL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Text(
              '5-Day Forecast',
              style: AppTypography.headlineSmall.copyWith(color: colors.label.normal),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          for (int i = 0; i < days.length; i++) ...[
            _DayItem(day: days[i]),
            if (i < days.length - 1) const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}

class _DayItem extends StatelessWidget {
  final HomeForecastDayData day;

  const _DayItem({required this.day});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              day.label,
              style: AppTypography.titleSmall.copyWith(color: colors.label.neutral),
            ),
          ),
          day.icon.toIcon(size: 22, color: colors.primary.normal),
          const Spacer(),
          SizedBox(
            width: 40,
            child: Text(
              day.high,
              textAlign: TextAlign.end,
              style: AppTypography.titleSmall.copyWith(color: colors.label.normal),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          SizedBox(
            width: 32,
            child: Text(
              day.low,
              textAlign: TextAlign.end,
              style: AppTypography.bodyMedium.copyWith(color: colors.label.neutral),
            ),
          ),
        ],
      ),
    );
  }
}
