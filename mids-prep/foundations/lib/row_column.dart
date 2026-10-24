
import 'package:flutter/material.dart';

class RowColumnPractice extends StatelessWidget {
  const RowColumnPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.call),
            Icon(Icons.message),
            Icon(Icons.email),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Product Name'),
        const Text('Product Description'),
        const Text('Product Price'),
      ],
    );
  }
}
