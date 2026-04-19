import 'package:flutter/material.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_typography.dart';
import 'package:weddy/screens/home/models/home_screen_model.dart';
import 'package:weddy/shared/card_box.dart';

class MessageSection extends StatelessWidget {
  final HomeMessageData message;

  const MessageSection({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CardBox(
      borderRadius: AppSpacing.radiusXL,
      backgroundColor: colors.primary.assistive,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colors.primary.alternative,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.info_outline, size: 20, color: colors.primary.normal),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.title,
                  style: AppTypography.titleMedium.copyWith(color: colors.label.normal),
                ),
                Text(
                  message.body,
                  style: AppTypography.bodyMedium.copyWith(color: colors.label.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
