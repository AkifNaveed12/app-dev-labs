import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CUI',
            style: TextStyle(
              fontSize: 68
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Text(
            'Wah Campus',
            style: TextStyle(fontSize: 38),
          ),
          Text(
            ' Akif',
            style: TextStyle(fontSize: 38),
          ),
            ],
          ),
          Icon(
            Icons.home,
            color: Colors.white70,
            size: 38,
            )
        ],
        ),
    );
  }
}