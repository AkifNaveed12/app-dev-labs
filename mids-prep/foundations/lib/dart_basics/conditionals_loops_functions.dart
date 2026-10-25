// void main() {
//   double amount = 2500;

//   if (amount > 2000) {
//     print('Expensive');
//   } else {
//     print('Affordable');
//   }
// }

void main() {
  int age = 17;

  if (age < 13) {
    print('Child');
  } else if (age <= 19) {
    print('Teen');
  } else if (age <= 59) {
    print('Adult');
  } else {
    print('Senior');
  }

  bool inStock = true;
  double price = 2500;

  if (inStock && price <= 3000) {
    print('Product can be purchased');
  }

  // ternary operator condition ? valueIfTrue : valueIfFalse
  double Price = 2500;

  String label = Price > 2000 ? 'Expensive' : 'Affordable';

  print(label);

  List<String> products = ['Mouse', 'Keyboard', 'Headphones'];

  for (int i = 0; i < products.length; i++) {
    print(products[i]);
  }

  // for in loop -> For each product in the products list, print that product.
  for (String product in products) {
    print(product);
  }

  // for each loop
  products.forEach((product) {
    print(product);
  });

  // break continue
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      continue;
    }
    print(i);
  }

  // functions
  // non parameterized
  void showWelcome() {
    print('Welcome to the app!');
  }

  showWelcome();

  // parameterized

  void showProduct(String name, double price) {
  print('$name costs PKR $price');
}
showProduct('Mouse', 2500);
  showProduct('Keyboard', 4000);


  // return value
  double calculateTotal(double price, int quantity) {
  return price * quantity;
}
  double total = calculateTotal(2500, 3);
  print(total);


  // arrow functions
  int square(int number) => number * number;

  // optional parameters
  String describeProduct(String name, double price) {
  return '$name: PKR $price';
}

describeProduct('Mouse', 2500);

// named parameters
String DescribeProduct({
  required String name,
  required double price,
}) {
  return '$name: PKR $price';
}
DescribeProduct(name: 'Mouse', price: 2500);

// default
void greet({String name = 'Guest'}) {
  print('Hello, $name');
}

greet();
greet(name: 'Akif');



// exercise
void showAffordableProducts(List<double> prices) {
  for (double price in prices) {
    if (price <= 3000) {
      print('Affordable: PKR $price');
    }
  }
}
  List<double> prices = [1500, 4500, 2500, 6000];
  showAffordableProducts(prices);
}
