import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  // TextField controllers
  TextEditingController _firstController =
      TextEditingController();

  TextEditingController _secondController =
      TextEditingController();

  // Result and message
  String result = '0';
  String message = 'Enter two numbers and select an operation.';


  // Colors
  Color darkGreen = const Color(0xFF283618);
  Color green = const Color(0xFF606C38);
  Color cream = const Color(0xFFFEFAE0);
  Color gold = const Color(0xFFDDA15E);
  Color brown = const Color(0xFFBC6C25);


  // Calculation function
  void calculate(String operation) {

    double? firstNumber =
        double.tryParse(_firstController.text);

    double? secondNumber =
        double.tryParse(_secondController.text);


    // Check first number
    if (firstNumber == null) {

      setState(() {
        result = '0';
        message = 'Please enter a valid first number.';
      });

      return;
    }


    // Check second number
    if (secondNumber == null) {

      setState(() {
        result = '0';
        message = 'Please enter a valid second number.';
      });

      return;
    }


    double answer;


    // Perform calculation
    if (operation == '+') {

      answer = firstNumber + secondNumber;

    } else if (operation == '-') {

      answer = firstNumber - secondNumber;

    } else if (operation == '×') {

      answer = firstNumber * secondNumber;

    } else {

      // Division by zero check
      if (secondNumber == 0) {

        setState(() {
          result = 'Error';
          message = 'Cannot divide by zero.';
        });

        return;
      }

      answer = firstNumber / secondNumber;
    }


    // Update UI
    setState(() {
      result = answer.toString();
      message =
          '$firstNumber $operation $secondNumber = $answer';
    });
  }


  // Clear everything
  void clearCalculator() {

    setState(() {

      _firstController.clear();
      _secondController.clear();

      result = '0';

      message =
          'Enter two numbers and select an operation.';
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: cream,

      appBar: AppBar(

        title: const Text(
          'Simple Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        backgroundColor: darkGreen,

        foregroundColor: cream,
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            // Heading
            Text(
              'Calculate Easily',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),


            Text(
              'Enter two numbers and choose an operation.',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 15,
                color: green,
              ),
            ),

            const SizedBox(height: 25),


            // First number
            TextField(

              controller: _firstController,

              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),

              decoration: InputDecoration(

                labelText: 'First Number',

                hintText: 'Enter first number',

                prefixIcon: const Icon(
                  Icons.looks_one,
                ),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),


            // Second number
            TextField(

              controller: _secondController,

              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),

              decoration: InputDecoration(

                labelText: 'Second Number',

                hintText: 'Enter second number',

                prefixIcon: const Icon(
                  Icons.looks_two,
                ),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),


            // Operation buttons
            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: [

                // Addition
                ElevatedButton(
                  onPressed: () {
                    calculate('+');
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: cream,
                    padding: const EdgeInsets.all(18),
                  ),

                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                // Subtraction
                ElevatedButton(
                  onPressed: () {
                    calculate('-');
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: cream,
                    padding: const EdgeInsets.all(18),
                  ),

                  child: const Text(
                    '−',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                // Multiplication
                ElevatedButton(
                  onPressed: () {
                    calculate('×');
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: cream,
                    padding: const EdgeInsets.all(18),
                  ),

                  child: const Text(
                    '×',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                // Division
                ElevatedButton(
                  onPressed: () {
                    calculate('÷');
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: cream,
                    padding: const EdgeInsets.all(18),
                  ),

                  child: const Text(
                    '÷',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),


            // Result container
            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: gold,

                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: Column(

                children: [

                  Text(
                    'RESULT',

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    result,

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),


            // Message
            Container(

              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(

                color: brown,

                borderRadius:
                    BorderRadius.circular(12),
              ),

              child: Text(
                message,

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: cream,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 25),


            // Clear button
            ElevatedButton.icon(

              onPressed: clearCalculator,

              icon: const Icon(
                Icons.clear,
              ),

              label: const Text(
                'CLEAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              style: ElevatedButton.styleFrom(

                backgroundColor: darkGreen,

                foregroundColor: cream,

                padding:
                    const EdgeInsets.symmetric(
                  vertical: 15,
                ),

                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {

    _firstController.dispose();
    _secondController.dispose();

    super.dispose();
  }
}