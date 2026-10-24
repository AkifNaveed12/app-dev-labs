
import 'package:flutter/material.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: const Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(
                    height: 12,
                    ),
                  Text(
                    'Akif Naveed',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text('Flutter Developer Student!'),
                  // option sections
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      //call
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.call),
                          const SizedBox(height: 6),
                          Text('Call'),
                        ],
                      ),
                      // email 
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(height: 6),
                          Text('Email'),
                        ],
                      ),
                      
                      //message
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.message),
                          const SizedBox(height: 6),
                          Text('Message'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              ),
          ),
        ),
    );
  }
}
