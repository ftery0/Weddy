import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weddy/core/app_theme.dart';
import 'package:weddy/core/app_icons.dart';
import 'package:weddy/core/app_typography.dart';

class WeddyBottomNav extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const WeddyBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<WeddyBottomNav> createState() => _WeddyBottomNavState();
}

class _WeddyBottomNavState extends State<WeddyBottomNav> {
  static const _tabs = [
    (icon: WeddyIcons.navForecast, label: 'FORECAST'),
    (icon: WeddyIcons.navRadar, label: 'RADAR'),
    (icon: WeddyIcons.navSettings, label: 'SETTINGS'),
  ];

  static const _indicatorWidth = 100.0;
  static const _indicatorHeight = 56.0;
  static const _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            offset: const Offset(0, -8),
            blurRadius: 40,
            spreadRadius: -12,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: colors.fill.normal.withValues(alpha: 0.95),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(29.5, 16, 29.5, 8),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final tabWidth = constraints.maxWidth / _tabs.length;
                    final indicatorLeft =
                        tabWidth * widget.currentIndex +
                        (tabWidth - _indicatorWidth) / 2;

                    return SizedBox(
                      height: _indicatorHeight,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: _duration,
                            curve: Curves.easeInOut,
                            left: indicatorLeft,
                            top: 0,
                            width: _indicatorWidth,
                            height: _indicatorHeight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colors.primary.assistive,
                                borderRadius: BorderRadius.circular(9999),
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              _tabs.length,
                              (i) => Expanded(
                                child: _NavItem(
                                  icon: _tabs[i].icon,
                                  label: _tabs[i].label,
                                  isActive: i == widget.currentIndex,
                                  onTap: () => widget.onTap(i),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final WeddyIcons icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon.toIcon(
              size: 22,
              color: isActive ? colors.primary.strong : colors.label.assistive,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: isActive ? colors.primary.strong : colors.label.assistive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
