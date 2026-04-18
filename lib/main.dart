import 'package:flutter/material.dart';
import 'package:weddy/screens/home/home_screen.dart';
import 'package:weddy/screens/map_screen.dart';
import 'package:weddy/screens/notifications_screen.dart';
import 'package:weddy/shared/weddy_header_bar.dart';
import 'package:weddy/shared/weddy_bottom_nav.dart';
import 'package:weddy/core/app_theme.dart';

void main() {
  runApp(const WeddyApp());
}

class WeddyApp extends StatelessWidget {
  const WeddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weddy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const _RootShell(),
    );
  }
}

class _RootShell extends StatefulWidget {
  const _RootShell();

  @override
  State<_RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<_RootShell> {
  int _currentIndex = 0;

  // FORECAST / RADAR / SETTINGS
  static const _screens = [
    HomeScreen(),
    MapScreen(),
    NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const WeddyHeaderBar(),
      bottomNavigationBar: WeddyBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
  
      body: Padding(
        padding: const EdgeInsets.only(bottom: 88),
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
    );
  }
}
