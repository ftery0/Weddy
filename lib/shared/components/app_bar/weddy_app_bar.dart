import 'package:flutter/material.dart';
import 'package:weddy/shared/theme/app_colors.dart';
import 'package:weddy/shared/theme/app_spacing.dart';
import 'package:weddy/shared/theme/app_typography.dart';

///  Body > Container (0,0 390x64)
/// - 왼쪽: 로고 아이콘 + "Weddy" 텍스트
/// - 오른쪽: 설정 아이콘 + 프로필 아바타
class WeddyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeddyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
            child: Row(
              children: [
                _buildLogo(),
                const Spacer(),
                _buildActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///  Container (24,24 22x16) + Heading 1 (54,16 83x32)
  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 로고 아이콘 —  VECTOR Icon, color #0059B9, 22x16
        Icon(
          Icons.waves_rounded,
          color: AppColors.brandBlue,
          size: 22,
        ),
        const SizedBox(width: 8),
        // 앱 이름 —  "Weddy", Inter Black 24px, letterSpacing -0.6
        Text(
          'Weddy',
          style: AppTypography.headlineMedium,
        ),
      ],
    );
  }

  ///  Container (300,16 66x32) — 설정 아이콘 + 프로필
  Widget _buildActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 설정 아이콘 —  VECTOR Icon, color #41475, 18x18
        Icon(
          Icons.tune_rounded,
          color: AppColors.onSurfaceVariant,
          size: 18,
        ),
        const SizedBox(width: AppSpacing.sm),
        // 프로필 아바타 —  Background (334,16 32x32), color #EFEEDD
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFEFEDED),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
