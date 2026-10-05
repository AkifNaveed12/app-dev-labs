import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double width =  MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          //design properties
          title: Text('My Portfolio'),
          backgroundColor: Colors.deepPurple,
          leading: Icon(Icons.person),
          actions: [
              Icon(Icons.settings),
            ],
          foregroundColor: Colors.white,
          centerTitle: true,

        ),
        body: ListView(
          // spacing: 10,
          children: [
            Text('Introduction' ,  style: myCustomHeading1(),),
            SizedBox(height: 20),

            customContainer(
            Colors.green,
            width * 0.2,
            height,
            ),
            SizedBox(height: 20),
            customContainer(Colors.green, width * 0.2, height),
            Text('Related Work', style: myCustomHeading1()),
            customContainer(Colors.blue, width * 0.4 , height),
            Text('Projects', style: myCustomHeading1()),
            customContainer(Colors.brown, width * 0.2 , height),
            Text('Reviews ' ,  style: myCustomHeading1(),),

            // Container(height: 100,  width: 100, color: Colors.green,),
            // Container(height: 100,  width: 100, color: Colors.blue,)

          ],

        )




    );
  } //end of build function

  Widget customContainer(Color _color, double w, double h){
    return Container(
      width: w,
      height: h * 0.6,
      decoration: BoxDecoration(
      color: _color,
      borderRadius: BorderRadius.circular(20),
    
    boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
    ],
      ) );

  }
  TextStyle myCustomHeading1(){

    return TextStyle(
        fontSize: 45, fontWeight: FontWeight.bold, color: Colors.orange);
  }


} //end of class
