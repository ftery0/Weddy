import 'package:flutter/material.dart';
import 'package:weddy/core/app_typography.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('지도', style: AppTypography.titleMedium));
  }
}
