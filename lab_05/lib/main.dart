import 'package:flutter/material.dart';
import 'CustomContainer.dart';
import 'StatefullDemo.dart';
import 'Calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF283618),
        ),
      ),
      home: const Calculator(),
    );
  }
}