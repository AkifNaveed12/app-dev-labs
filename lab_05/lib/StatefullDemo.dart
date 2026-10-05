import 'package:flutter/material.dart';

class Statefulldemo extends StatefulWidget {
  const Statefulldemo({super.key});

  @override
  State<Statefulldemo> createState() => _StatefulldemoState();
}

class _StatefulldemoState extends State<Statefulldemo> {

  // STATE VARIABLES

  String str = 'Old data';

  int counter = 0;

  double _h = 200;
  double _w = 200;

  Color _c = Colors.blue;

  bool flag = true;

  // TEXT FIELD CONTROLLERS

  TextEditingController _nameController =
      TextEditingController();

  TextEditingController _passwordController =
      TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Stateful Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // -----------------------
            // COUNTER
            // -----------------------

            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: () {

                    setState(() {
                      counter++;
                    });

                  },
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),

                IconButton(
                  onPressed: () {

                    setState(() {

                      if (counter > 0) {
                        counter--;
                      }

                    });

                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 50,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),


            // -----------------------
            // NAME INPUT
            // -----------------------

            TextField(
              controller: _nameController,

              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),

              onSubmitted: (value) {

                setState(() {
                  str = value;
                });

              },
            ),

            const SizedBox(height: 15),


            // -----------------------
            // PASSWORD INPUT
            // -----------------------

            TextField(
              controller: _passwordController,

              obscureText: true,

              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),


            // -----------------------
            // SHOW INPUT
            // -----------------------

            ElevatedButton(
              onPressed: () {

                setState(() {});

              },
              child: const Text('Show Name'),
            ),

            const SizedBox(height: 10),

            Text(
              'Name: ${_nameController.text}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              str,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 10),


            // -----------------------
            // CLEAR
            // -----------------------

            ElevatedButton(
              onPressed: () {

                setState(() {

                  _nameController.clear();
                  _passwordController.clear();

                  str = 'Cleared';

                });

              },
              child: const Text('Clear'),
            ),

            const SizedBox(height: 30),


            // -----------------------
            // CONTAINER STATE
            // -----------------------

            AnimatedContainer(
              duration: const Duration(
                milliseconds: 500,
              ),

              height: _h,
              width: _w,

              decoration: BoxDecoration(
                color: _c,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 20),


            // -----------------------
            // CHANGE CONTAINER
            // -----------------------

            IconButton(
              onPressed: () {

                setState(() {

                  if (flag) {

                    _h = 300;
                    _w = 300;
                    _c = Colors.green;

                    flag = false;

                  } else {

                    _h = 200;
                    _w = 200;
                    _c = Colors.blue;

                    flag = true;
                  }

                });

              },

              icon: const Icon(
                Icons.alarm,
                size: 50,
              ),
            ),

          ],
        ),
      ),
    );
  }


  @override
  void dispose() {

    _nameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}