String name = 'akif';
int age = 20;

double gpa = 3.94;
bool isStudent = true;

List<String> things = ['call', 'message'];
Map<String, dynamic> info = {'name': 'Akif'};

var stock = 10;
var isgraduate = true;

// var infers the type; a variable declared with var can be reassigned.
// final prevents reassignment after initialization.
// const is a compile-time constant and also prevents reassignment.

var quantity = 2;
// quantity = 5; // Allowed

final studentName = 'Akif';
// studentName = 'Ali'; // Not allowed

const taxRate = 0.05;
// taxRate = 0.10; // Not allowed

// string interpolation
String displayName = 'Akif';
double price = 299.99;

// type conversions
String amountText = '500';
double amount = double.parse(amountText);


// tasks

// 
void main() {
  print('Hello, $displayName');
  print('Price: PKR $price');
  print('Total: PKR ${price * 2}');
  print("the amount is $amount");
}
