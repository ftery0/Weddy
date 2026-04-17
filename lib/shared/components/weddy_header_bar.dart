import 'package:flutter/material.dart';
import 'package:weddy/shared/theme/color/app_theme.dart';
import 'package:weddy/shared/theme/color/app_palette.dart';
import 'package:weddy/shared/theme/app_icons.dart';
import 'package:weddy/shared/theme/app_spacing.dart';
import 'package:weddy/shared/components/weddy_logo.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
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
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppPalette.cream100,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
