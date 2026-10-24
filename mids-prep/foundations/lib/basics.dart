
import 'package:flutter/material.dart';
import 'row_column.dart';

class BasicsScreen extends StatelessWidget {
  const BasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Screen'),
      ),
      body: const Column(
        children: [
          Text('Hello Flutter!'),
          RowColumnPractice(),
        ],
      ),
    );
  }
}
