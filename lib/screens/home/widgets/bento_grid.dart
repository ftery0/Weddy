import 'package:flutter/material.dart';
import 'package:weddy/core/app_icons.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_typography.dart';
import 'package:weddy/screens/home/models/home_screen_model.dart';
import 'package:weddy/shared/card_box.dart';
import 'package:weddy/shared/progress_bar.dart';

class BentoGrid extends StatelessWidget {
  final List<HomeDetailCardData> cards;

  const BentoGrid({super.key, required this.cards})
      : assert(cards.length == 4, 'BentoGrid expects exactly 4 cards.');

  static const _gap = AppSpacing.md;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildCard(context, cards[0])),
              const SizedBox(width: _gap), // 카드 사이 가로 간격
              Expanded(child: _buildCard(context, cards[1])),
            ],
          ),
        ),
        const SizedBox(height: _gap), // 행 사이 세로 간격
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildCard(context, cards[2])),
              const SizedBox(width: _gap),
              Expanded(child: _buildCard(context, cards[3])),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, HomeDetailCardData card) {
    final colors = context.colors;

   
    final valueText = Text(
      card.value,
      style: AppTypography.headlineMedium.copyWith(color: colors.label.normal),
    );

    final supportingText = Text(
      card.supportingText ?? '',
      style: AppTypography.labelMedium.copyWith(color: colors.label.alternative, height: 1.4),
    );

    return CardBox(
      borderRadius: AppSpacing.radiusXL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              card.icon.toIcon(size: 18, color: colors.label.alternative),
              const SizedBox(width: AppSpacing.sm),
              Text(card.title, style: AppTypography.labelMedium.copyWith(color: colors.label.alternative)),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          switch (card.variant) {
            BentoCardVariant.progress => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                valueText,
                const SizedBox(height: AppSpacing.sm),
                ProgressBar(value: card.progress ?? 0),
              ],
            ),
            BentoCardVariant.description => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [valueText, const SizedBox(height: AppSpacing.md), supportingText],
            ),

            BentoCardVariant.subtitle => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [valueText, const SizedBox(height: AppSpacing.xs), supportingText],
            ),

            BentoCardVariant.unitAndSubtitle => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(text: '${card.value} ', style: AppTypography.headlineMedium.copyWith(color: colors.label.normal)),
                  TextSpan(text: card.unit ?? '', style: AppTypography.bodyMedium.copyWith(color: colors.label.normal)),
                ])),
                const SizedBox(height: AppSpacing.xs),
                supportingText,
              ],
            ),
          },
        ],
      ),
    );
  }
}
