import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My first screen')),
      body: Column(
          children: [
            Text('Hello Flutter!'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.call),
              Icon(Icons.message),
              Icon(Icons.email),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Name'),
                Text('Product Description'),
                Text('Product Price'),
              ],
            ),
          ],
        ),
      );
    }
}
