import 'package:flutter/material.dart';
import 'package:weddy/core/app_spacing.dart';
import 'package:weddy/screens/home/models/home_screen_model.dart';
import 'package:weddy/screens/home/widgets/bento_grid.dart';
import 'package:weddy/screens/home/widgets/forecast_section.dart';
import 'package:weddy/screens/home/widgets/hero_section.dart';
import 'package:weddy/screens/home/widgets/message_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const home = mockHomeScreen;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pagePadding,
        vertical: AppSpacing.md,
      ),
      child: Column(
        children: [
          HeroSection(data: home.hero),
          const SizedBox(height: AppSpacing.lg),
          BentoGrid(cards: home.detailCards),
          const SizedBox(height: AppSpacing.lg),
          ForecastSection(days: home.forecastDays),
          const SizedBox(height: AppSpacing.lg),
          MessageSection(message: home.message),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
