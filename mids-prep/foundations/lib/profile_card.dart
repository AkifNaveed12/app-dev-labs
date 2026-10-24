
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


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
                    child: Icon(Icons.person, size: 40),
                  ),
                  SizedBox(
                    height: 12,
                    ),
                  Text(
                    'Akif Naveed',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Flutter Developer Student!'),
                  // option sections
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      //call
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.call),
                          SizedBox(height: 6),
                          Text('Call'),
                        ],
                      ),
                      // email 
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail),
                          SizedBox(height: 6),
                          Text('Email'),
                        ],
                      ),
                      
                      //message
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.message),
                          SizedBox(height: 6),
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
