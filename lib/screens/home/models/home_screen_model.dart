import 'package:weddy/core/app_icons.dart';

/// 홈 화면에 필요한 UI 데이터 구조.
class HomeScreenModel {
  final HomeHeroData hero;
  final List<HomeDetailCardData> detailCards;
  final List<HomeForecastDayData> forecastDays;
  final HomeMessageData message;

  const HomeScreenModel({
    required this.hero,
    required this.detailCards,
    required this.forecastDays,
    required this.message,
  });
}

class HomeHeroData {
  final String temperature;
  final String condition;
  final List<HomeQuickStatData> quickStats;

  const HomeHeroData({
    required this.temperature,
    required this.condition,
    required this.quickStats,
  });
}

class HomeQuickStatData {
  final WeddyIcons icon;
  final String label;
  final String value;

  const HomeQuickStatData({
    required this.icon,
    required this.label,
    required this.value,
  });
}

/// Bento Grid 카드의 렌더링 방식.
enum BentoCardVariant { progress, description, subtitle, unitAndSubtitle }

class HomeDetailCardData {
  final WeddyIcons icon;
  final String title;
  final String value;
  final String? unit;
  final String? supportingText;
  final double? progress;
  final BentoCardVariant variant;

  const HomeDetailCardData({
    required this.icon,
    required this.title,
    required this.value,
    required this.variant,
    this.unit,
    this.supportingText,
    this.progress,
  });
}

class HomeForecastDayData {
  final String label;
  final WeddyIcons icon;
  final String high;
  final String low;

  const HomeForecastDayData({
    required this.label,
    required this.icon,
    required this.high,
    required this.low,
  });
}

class HomeMessageData {
  final String title;
  final String body;

  const HomeMessageData({required this.title, required this.body});
}

// Mock data
const mockHomeScreen = HomeScreenModel(
  hero: HomeHeroData(
    temperature: '24°',
    condition: 'Partly Cloudy',
    quickStats: [
      HomeQuickStatData(icon: WeddyIcons.statHigh,  label: 'H:',    value: '28°'),
      HomeQuickStatData(icon: WeddyIcons.statLow,   label: 'L:',    value: '19°'),
      HomeQuickStatData(icon: WeddyIcons.statFeels, label: 'Feels', value: '26°'),
    ],
  ),
  detailCards: [
    HomeDetailCardData(
      icon: WeddyIcons.airQuality,
      title: 'AIR QUALITY',
      value: 'Good',
      progress: 0.25,
      variant: BentoCardVariant.progress,
    ),
    HomeDetailCardData(
      icon: WeddyIcons.rainProbability,
      title: 'RAIN PROB.',
      value: '7%',
      supportingText: 'None expected\ntoday',
      variant: BentoCardVariant.description,
    ),
    HomeDetailCardData(
      icon: WeddyIcons.uvIndex,
      title: 'UV INDEX',
      value: 'Moderate',
      supportingText: 'Level 4',
      variant: BentoCardVariant.subtitle,
    ),
    HomeDetailCardData(
      icon: WeddyIcons.wind,
      title: 'WIND',
      value: '12',
      unit: 'km/h',
      supportingText: 'Coming from NW',
      variant: BentoCardVariant.unitAndSubtitle,
    ),
  ],
  forecastDays: [
    HomeForecastDayData(icon: WeddyIcons.uvIndex,          label: 'Today', high: '28°', low: '19°'),
    HomeForecastDayData(icon: WeddyIcons.navForecast,      label: 'Mon',   high: '26°', low: '18°'),
    HomeForecastDayData(icon: WeddyIcons.navForecast,      label: 'Tue',   high: '24°', low: '17°'),
    HomeForecastDayData(icon: WeddyIcons.rainProbability,  label: 'Wed',   high: '22°', low: '16°'),
    HomeForecastDayData(icon: WeddyIcons.uvIndex,          label: 'Thu',   high: '27°', low: '18°'),
  ],
  message: HomeMessageData(
    title: 'Planning your day?',
    body: "It's a perfect day for outdoor activities. The air quality is great "
        'and the temperature is comfortable.',
  ),
);
