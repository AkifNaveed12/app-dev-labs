
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body);

      final List<dynamic> items = data['products'] ?? [];

      return items
          .map((item) => Product.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
