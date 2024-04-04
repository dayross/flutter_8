import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  static const String name = 'card_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cards Screens'),
      ),
      body: const Placeholder(),
    );
  }
}
