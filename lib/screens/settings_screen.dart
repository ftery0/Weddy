import 'package:flutter/material.dart';
import 'package:weddy/core/app_typography.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('설정', style: AppTypography.titleMedium));
  }
}
