import 'package:flutter/material.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_palette.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/core/app_typography.dart';
import 'package:weddy/shared/weddy_logo.dart';

class WeddyHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const WeddyHeaderBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      color: colors.background.neutral,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.pagePadding,
            ),
            child: Row(
              children: [
                const WeddyLogo(),
                const Spacer(),
                _Actions(colors: colors),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  final WeddyColors colors;
  const _Actions({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: AppSpacing.md),
        Icon(Icons.search_rounded, size: 18, color: colors.label.normal),
        const SizedBox(width: AppSpacing.md),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppPalette.cream100,
            shape: BoxShape.circle,
            border: Border.all(color: colors.line.alternative),
          ),
          child: SizedBox(
            width: 32,
            height: 32,
            child: Center(
              child: Text(
                'H',
                style: AppTypography.labelLarge.copyWith(
                  color: colors.label.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
