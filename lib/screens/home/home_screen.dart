import 'package:flutter/material.dart';
import 'package:weddy/core/app_typography.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
       return Center(child: Text('홈', style: AppTypography.titleMedium));

  }
}
