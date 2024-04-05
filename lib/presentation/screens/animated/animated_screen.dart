import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 200;
  double height = 200;
  double borderRadius = 10;
  Color color = Colors.black;

  void changeShape() {
    final random = Random();

    this.width = random.nextInt(220) + 80;
    this.height = random.nextInt(220) + 80;
    this.borderRadius = random.nextInt(90) + 0;

    this.color = Color.fromRGBO(
        random.nextInt(255), // red
        random.nextInt(255), // green
        random.nextInt(255), // blue
        1); // opacity
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeShape();
          setState(() {});
        },
        child: Icon(Icons.plus_one),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(this.borderRadius)),
        ),
      ),
    );
  }
}
