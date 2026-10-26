
import 'package:flutter/material.dart';
import 'screens/airport_map_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Airport App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const AirportMapScreen(),
    );
  }
}
