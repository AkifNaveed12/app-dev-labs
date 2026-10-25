void main() {
  List<String> products = ['Mouse', 'Keyboard', 'Headphones'];

  print(products[0]); // Mouse
  print(products[2]); // Headphones
  print(products.length); // 3

  // list operations
  products.add('Monitor'); // Add an item
  products.remove('Mouse'); // Remove by value
  products.removeAt(0); // Remove by index
  print(products.contains('Keyboard')); // true
  print(products.isEmpty); // false

  //A list declared with final can still be modified:
  final List<String> Products = ['Mouse'];
  Products.add('Keyboard'); // Valid
  // products = ['Monitor']; // Invalid

  // Maps
  Map<String, dynamic> product = {
    'name': 'Headphones',
    'price': 2999.99,
    'inStock': true,
  };

  print(product['name']); // Headphones
  print(product['price']); // 2999.99
  print(product['inStock']); // true

  // updating and accessing Maps
  product['price'] = 2499.99; // Update a value
  product['brand'] = 'AudioPro'; // Add a key-value pair
  product.remove('inStock'); // Remove a key

  print(product.containsKey('name')); // true
  print(product.keys); // All keys
  print(product.values); // All values

  List<Map<String, dynamic>> items = [
    {'name': 'Mouse', 'price': 1500},
    {'name': 'Keyboard', 'price': 3500},
    {'name': 'Headphones', 'price': 2800},
  ];

  List<String> cart = ['Mouse', 'Keyboard', 'Headphones'];

  cart.forEach((item) {
    print(item);
  });

  // same thing using arrow function
  cart.forEach((product) => print(product));

  // map() - transform every item
List<double> prices = [1000, 2000, 3000];

var updatedPrices = prices.map((price) => price * 1.10).toList();

print(updatedPrices); // [1100.0, 2200.0, 3300.0]ry item

List<String> names = ['akif', 'ali', 'sara'];

List<String> capitalizedNames =
    names.map((name) => name.toUpperCase()).toList();

print(capitalizedNames);
// [AKIF, ALI, SARA]

// where() filter a list
List<int> Prices = [500, 2500, 1200, 4000, 800];

List<int> expensivePrices =
    Prices.where((price) => price > 1000).toList();

print(expensivePrices); // [2500, 1200, 4000]


// map + where 

List<int> PriceS = [500, 2500, 1200, 4000, 800];

List<String> results = PriceS
    .where((price) => price > 1000)
    .map((price) => 'PKR $price')
    .toList();

print(results);
// [PKR 2500, PKR 1200, PKR 4000]

// any()
List<int> PRiceS = [500, 2500, 1200, 4000, 800];

bool hasExpensiveProduct = PRiceS.any((price) => price > 3000);

print(hasExpensiveProduct); // true


// every() do all items match?
List<int> PRices = [500, 800, 900];

bool allAffordable = PRices.every((price) => price < 1000);

print(allAffordable); // true


// FirstWhere() find the 1st matching item
List<int> prIces = [500, 2500, 1200, 4000];

int result = prIces.firstWhere(
  (price) => price > 2000,
  orElse: () => 0,
);

print(result); // 2500

// combine all scenario

  List<Map<String, dynamic>> PRODUCTS = [
    {'name': 'Mouse', 'price': 1500},
    {'name': 'Keyboard', 'price': 3500},
    {'name': 'Headphones', 'price': 2800},
  ];

  // Print every product
  PRODUCTS.forEach((product) {
    print(product['name']);
  });

  // Filter products costing less than 3000
  var affordable = PRODUCTS
      .where((product) => product['price'] < 3000)
      .toList();

  // Extract their names
  List<String> NAMES = affordable
      .map((product) => product['name'] as String)
      .toList();

  print(NAMES); // [Mouse, Headphones]

  // Check whether at least one product costs over 3000
  bool hasExpensive = PRODUCTS
      .any((product) => product['price'] > 3000);

  print(hasExpensive); // true

}
