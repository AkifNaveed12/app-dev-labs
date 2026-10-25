// The two conversion functions you'll use most often are:
// - jsonDecode(jsonString) → converts JSON text into Dart maps/lists.
// - jsonEncode(mapOrList) → converts a Dart map/list into a JSON string.a

import 'dart:convert';

void main() {
  // Map -> JSON string
  Map<String, dynamic> data = {'name': 'Mouse', 'price': 1500};
  String jsonString = jsonEncode(data);

  // JSON string -> Map
  Map<String, dynamic> decoded = jsonDecode(jsonString);

  // Map -> List of values (not a JSON conversion)
  List<dynamic> values = decoded.values.toList();

  print(jsonString);
  print(decoded['name']);
  print(values);
}