import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weddy/shared/theme/app_spacing.dart';
import 'package:weddy/shared/theme/app_typography.dart';

class WeddyLogo extends StatelessWidget {
  const WeddyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/logo.svg',
          width: 22,
          height: 16,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text('Weddy', style: AppTypography.headlineMedium),
      ],
    );
  }
}