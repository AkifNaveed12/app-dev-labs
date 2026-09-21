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
      // backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.school),
        title: const Text(
          'Student Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.settings),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.school,
            size: 80,
            color: Colors.blue,
          ),
          Text(
            'Muhammad Akif Naveed',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Software Engineering Student',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                    Icon(Icons.school),
                    Text('CUI Wah Campus')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.badge),
                  Text('BSE - 5B'),
                ],
              )
            ],
          ),
          Text(
            'Welcome Akif!',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            iconSize: 35,
            color: Colors.red,
            onPressed: () {
              print('Favorite button pressed');
              },
          ),
        ],
        ),
    );
  }
}