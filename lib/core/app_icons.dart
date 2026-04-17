import 'package:flutter/material.dart';

enum WeddyIcons {
  // ── App Bar
  appBarLogo(Icons.waves_rounded),
  appBarNotification(Icons.notifications_outlined),

  // ── Bottom Navigation
  navForecast(Icons.wb_cloudy_outlined),
  navRadar(Icons.radar),
  navSettings(Icons.settings_outlined),

  // ── Home: Mini Stats Row
  statHigh(Icons.arrow_upward_rounded),
  statLow(Icons.arrow_downward_rounded),
  statFeels(Icons.thermostat_rounded),

  // ── Home: Bento Grid
  airQuality(Icons.air_rounded),
  rainProbability(Icons.water_drop_outlined),
  uvIndex(Icons.wb_sunny_outlined),
  wind(Icons.wind_power_outlined),

  // ── Home: Dynamic Message
  dynamicMessageTip(Icons.lightbulb_outline_rounded),

  // ── Sub-screen App Bar
  arrowBack(Icons.arrow_back_rounded),
  moreVert(Icons.more_vert),

  // ── Settings: List Navigation
  chevronRight(Icons.chevron_right_rounded),

  // ── Settings: Sound & Vibration 
  soundToggle(Icons.volume_up_outlined),
  vibrationToggle(Icons.vibration),
  radioSelected(Icons.radio_button_checked),
  radioUnselected(Icons.radio_button_unchecked),

  // ── Radar: App Bar
  mapFilter(Icons.tune),

  // ── Radar: Map Controls
  mapZoomIn(Icons.add_rounded),
  mapZoomOut(Icons.remove_rounded),
  mapLayers(Icons.layers_outlined),
  mapMyLocation(Icons.my_location),

  // ── Radar: Playback
  radarPlay(Icons.play_arrow_rounded),
  radarPause(Icons.pause_rounded);

  final IconData data;
  const WeddyIcons(this.data);
}

extension WeddyIconsToWidget on WeddyIcons {
  Icon toIcon({double size = 22, Color? color}) =>
      Icon(data, size: size, color: color);
}
