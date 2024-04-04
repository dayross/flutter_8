import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.purple,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.lime,
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.red,
  Color.fromARGB(255, 255, 99, 151),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, "Choose an option from the ones given"),
        assert(selectedColor < colorList.length,
            "Choose an option from the ones given");

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );
}
