// A class defines the structure of an object.
//An object is an instance created from that class.
// A constructor initializes its fields.
import 'dart:convert';
class Product {
  String name;
  double price;
  String id;

  Product({required this.id, required this.name, required this.price});

  // from json
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  // toJson()
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  @override
  String toString() {
    return '$name costs PKR $price';
  }
}

void main() {
  //Product p = Product(name: 'Mouse', price: 1500);

  //print(p.name);
  //print(p.price);
  final product = Product.fromJson({
  'id': 'p1',
  'name': 'Mouse',
  'price': 1500,
});

print(product.name);                // Mouse
print(product.toString());          // Mouse costs PKR 1500.0
print(jsonEncode(product.toJson())); // JSON string
}
