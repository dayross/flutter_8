import 'package:flutter/material.dart';
import 'package:flutter_8/config/router/app_router.dart';
import 'package:flutter_8/config/theme/app_theme.dart';
import 'package:flutter_8/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: selectedColor,
        isDarkMode: isDarkMode).getTheme(),
    );
  }
}
