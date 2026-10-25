import 'package:flutter/material.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Section A: Appbar
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      //Section B: Product content
      body: SingleChildScrollView( // makes child scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey[300],
              child: Center(
                child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Icon(Icons.headphones, size: 64),
                  const SizedBox(height: 6),
                  Text('Product image area')
                ],
              ),
              )
            ),

            // Section C: Product Information
            const SizedBox(height: 20),
            Text(
              " Premium Wireless Headphones",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ), 
            ),
            SizedBox(height: 6),
            Text(
              ' SKU: WH-1000X',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.star),
                const Text(
                  ' 4.5 (128 reviews)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  ' PKR 299.99',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 5, 61, 7),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                const Text(
                  ' PKR 399.99',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                const Icon(
                  Icons.discount,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Color.fromARGB(255, 30, 162, 36),
                  size: 10,
                  ),
                Padding(padding: EdgeInsets.all(2)),
                const Text(
                  ' In Stock',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 23, 102, 25),
                  ),
                ),
              ],
            ),

            // Section C: Product Description
            SizedBox(height: 20),
            const Text(
              ' Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,              
                ),
            ),
            const SizedBox(height: 6),
            const Text(
            " Experience premium sound with wireless headphones designed for comfort and everyday listening.",
            ),

            // Section D: Specification
            SizedBox(height: 4),
            Container(
              height: 500,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Card(
                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                color: const Color.fromARGB(255, 75, 75, 75),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    const Text(
                    ' Specifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Row 1
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Brand',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        'AudioPro',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Row 2
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Model',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        'WH-1000X',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Row 3
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Color',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        'Midnight Black',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Row 4
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Connectivity',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        'Bluetooth 5.0',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                      // Row 5
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Battery Life',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        '30 Hrs',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Row 6
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Weight',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        '250g',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Row 7
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Warranty',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(90)),
                      const Text(
                        '1 year',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ],
                ),
                ),
              ),
            )
            ),
            ),
          ],
        ),
      )
    );
  }
}
