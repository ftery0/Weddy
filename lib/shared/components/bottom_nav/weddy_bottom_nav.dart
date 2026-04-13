import 'package:flutter/material.dart';
import 'package:weddy/shared/theme/app_colors.dart';
import 'package:weddy/shared/theme/app_decorations.dart';
import 'package:weddy/shared/theme/app_spacing.dart';

/// - 4개 탭: Home(활성), Map, Notifications, Settings
/// - 활성 탭: primaryContainer 배경 + activeTeal 아이콘
/// - 비활성 탭: 투명 배경 + onSurfaceVariant 아이콘
class WeddyBottomNav extends StatelessWidget {
  /// 현재 선택된 탭 인덱스 (0=홈, 1=지도, 2=알림, 3=설정)
  final int currentIndex;

  /// 탭 변경 콜백
  final ValueChanged<int> onTap;

  const WeddyBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItem(icon: Icons.home_rounded, label: '홈'),
    _NavItem(icon: Icons.map_outlined, label: '지도'),
    _NavItem(icon: Icons.notifications_outlined, label: '알림'),
    _NavItem(icon: Icons.settings_outlined, label: '설정'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceContainerLowest,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_items.length, (i) {
                return _buildNavButton(index: i, item: _items[i]);
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({required int index, required _NavItem item}) {
    final isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 46,
        height: 46,
        decoration: isActive
            //  활성 버튼 배경 primaryContainer (#A0D8EF), 반지름 16px
            ? AppDecorations.activeNavItem
            : const BoxDecoration(color: Colors.transparent),
        child: Icon(
          item.icon,
          //  활성 #235F73 / 비활성 #41474C
          color: isActive ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
          size: 22,
        ),
      ),
    );
  }
}

/// 네비게이션 탭 데이터 모델
class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
