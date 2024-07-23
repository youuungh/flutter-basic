import 'package:flutter/material.dart';

final customTheme = ThemeData(
  // colorScheme: const ColorScheme.light(
  //   primary: Colors.indigo,
  //   secondary: Colors.green,
  //   tertiary: Colors.yellow
  // ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30)),
    useMaterial3: true
);