import 'package:flutter/material.dart';
import 'package:flutter_8/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a theme'), actions: [
        IconButton(
          icon: Icon(isDarkMode
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          onPressed: () {
            ref
                .read(darkModeProvider.notifier)
                .update((isDarkMode) => !isDarkMode);
          },
        ),
      ]),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text(
                'Este color',
                style: TextStyle(color: color),
              ),
              subtitle: Text('${color.value}'),
              activeColor: colors[selectedColor],
              value: index,
              groupValue: selectedColor,
              onChanged: ((value) {
                ref.read(selectedColorProvider.notifier).state = index;
              }));
        });
  }
}
