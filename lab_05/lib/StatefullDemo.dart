import 'package:flutter/material.dart';

class Statefulldemo extends StatefulWidget {
  // const Statefulldemo({super.key});

  @override
  State<Statefulldemo> createState() => _StatefulldemoState();
}

class _StatefulldemoState extends State<Statefulldemo> {
  String str = 'Old data';
  int counter = 0;
  double _h= 200, _w = 200;
  Color _c = Colors.blue;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('$counter', style: TextStyle(fontSize: 50)),
            Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    icon: Icon(Icons.add, size: 50),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (counter > 0) counter--;
                      });
                    },
                    icon: Icon(Icons.remove, size: 50),
                  ),


                ],
              ),
            ),
            Container(height: _h, width: _w, color: _c,),
          IconButton(onPressed: (){
            setState(() {
           if(flag){
             _h = 400;
             _w =  400;
             _c = Colors.green;
             flag = false;

           }
           else{
             _h = 200;
             _w =  200;
             _c = Colors.blue;
             flag = true;

           }
            });

          }, icon: Icon(Icons.alarm, size: 50))

            //
            // Text(str, style: TextStyle(fontSize: 45),),
            // IconButton(onPressed: (){
            //
            //   setState(
            //           () {
            //   str = 'New Data';
            //   }
            //   );
            //
            //
            //   // print(str);
            //
            // }, icon: Icon(size: 50,Icons.ads_click))
          ],
        ),
      ),
    );
  }
}
