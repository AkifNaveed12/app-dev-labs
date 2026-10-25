import 'dart:convert';
import 'package:http/http.dart' as http;
import 'oop.dart';

Future<String> getMessage() async {
  return 'Data loaded';
}

Future<void> main() async {
  // print('1');
  // String message = await getMessage();
  // print('AKIF');
  // print(message);
  // print('2');
  final products = await getProducts();
  for (final product in products) {
    print(product);
  }
}

Future<List<Product>> getProducts() async {
  final url = Uri.parse('https://dummyjson.com/products');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);

    final List<dynamic> productData = jsonData['products'] ?? [];

    return productData.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

//loading function
// Future<void> loadData() async {
//   try {
//     List<Product> temp = await getProducts();

//     if (!mounted) return;

//     setState(() {
//       products = temp;
//       isLoading = false;
//     });
//   } catch (e) {
//     if (!mounted) return;

//     setState(() {
//       isLoading = false;
//     });
//   }
// }
