import 'package:flutter/material.dart';
import 'package:flutter_8/presentation/providers/counter_provider.dart';
import 'package:flutter_8/presentation/providers/theme_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterClick = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(darkModeProvider);
    
          
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(darkModeProvider.notifier).update((isDarkMode) => !isDarkMode);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valor : $counterClick', style: const TextStyle(fontSize: 32))
            //Text('Valor : ',style: const TextStyle(fontSize: 32))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // ambas son formas de modificar el provider
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}
