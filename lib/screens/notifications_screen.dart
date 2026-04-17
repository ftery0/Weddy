import 'package:flutter/material.dart';
import 'package:weddy/core/app_typography.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('알림', style: AppTypography.titleMedium));
  }
}
