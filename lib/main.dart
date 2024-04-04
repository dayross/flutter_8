import 'package:flutter/material.dart';
import 'package:flutter_8/config/theme/app_theme.dart';
import 'package:flutter_8/presentation/screens/buttons/buttons_screens.dart';
import 'package:flutter_8/presentation/screens/cards/cards_screen.dart';

import 'presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonsScreens(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
