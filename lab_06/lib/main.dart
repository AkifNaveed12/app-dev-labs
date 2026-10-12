
import 'package:flutter/material.dart';

// ============================================================
// COLOR PALETTE
// ============================================================

const Color appYellow = Color(0xFFFABC3C);
const Color appRed = Color(0xFFDB3A34);
const Color appWhite = Color(0xFFF7F7FF);
const Color appPurple = Color(0xFF6E44FF);

// ============================================================
// PRODUCT DATA
// Five attributes: name, brand, price, description, image
// ============================================================

final List<Map<String, String>> products = [
  {
    'name': 'iPhone 16',
    'brand': 'Apple',
    'price': '250000',
    'description': '128 GB smartphone',
    'image': 'https://up.yimg.com/ib/th/id/OIP.azIej7bJLFwzUlD5Mb939gHaEK?pid=Api&rs=1&c=1&qlt=95&w=213&h=119',
  },
  {
    'name': 'Galaxy S24',
    'brand': 'Samsung',
    'price': '220000',
    'description': 'Android smartphone',
    'image': 'https://static1.anpoimages.com/wordpress/wp-content/uploads/wm/2024/01/samsung-galaxy-s24-rear-1.jpg',
  },
  {
    'name': 'AirPods Pro',
    'brand': 'Apple',
    'price': '65000',
    'description': 'Wireless noise-cancelling earbuds',
    'image': 'https://up.yimg.com/ib/th/id/OIP.AxYmtgN4JG7kCRGJxermFwHaEK?pid=Api&rs=1&c=1&qlt=95&w=205&h=115',
  },
  {
    'name': 'Sony Headphones',
    'brand': 'Sony',
    'price': '45000',
    'description': 'Wireless over-ear headphones',
    'image': 'https://up.yimg.com/ib/th/id/OIP.1a4epZsn_DJWe_yXLZJXHQHaHa?pid=Api&rs=1&c=1&qlt=95&w=105&h=105',
  },
];

void main() {
  runApp(const MyApp());
}

// ============================================================
// ROOT APPLICATION
// ============================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electronics Store',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: appWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: appPurple,
          primary: appPurple,
          secondary: appYellow,
          error: appRed,
          surface: appWhite,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: appPurple,
          foregroundColor: appWhite,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: appWhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: appPurple,
              width: 2,
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Opens the detail screen for a selected product.
  void openDetails(Map<String, String> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(product: product),
      ),
    );
  }

  // Opens the form and receives the newly created product.
  Future<void> createProduct() async {
    final product = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateProductScreen(),
      ),
    );

    if (!mounted) return;

    if (product != null) {
      setState(() {
        products.add(product);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product['name']} added successfully!'),
          backgroundColor: appPurple,
        ),
      );
    }
  }

  // Loads either a local asset or an online image.
  Widget productImage(
    String? imagePath, {
    double size = 90,
  }) {
    final path = imagePath?.trim() ?? '';

    Widget fallback() {
      return Container(
        color: appYellow.withValues(alpha: 0.25),
        alignment: Alignment.center,
        child: const Icon(
          Icons.devices,
          color: appPurple,
          size: 36,
        ),
      );
    }

    Widget image;

    if (path.startsWith('https://') ||
        path.startsWith('http://')) {
      image = Image.network(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback(),
      );
    } else {
      final assetPath = path.isEmpty || path == 'tempimg.png'
          ? 'assets/tempimg.png'
          : path;

      image = Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback(),
      );
    }

    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: image,
      ),
    );
  }

  // Reusable product card for all three layouts.
  Widget productCard(
    Map<String, String> product, {
    bool horizontal = false,
  }) {
    return Card(
      color: appWhite,
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: appPurple.withValues(alpha: 0.15),
        ),
      ),
      child: InkWell(
        onTap: () => openDetails(product),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: horizontal
              ? Row(
                  children: [
                    productImage(product['image'], size: 76),
                    const SizedBox(width: 12),
                    Expanded(
                      child: productText(product),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    productImage(product['image'], size: 82),
                    const SizedBox(height: 10),
                    productText(product),
                  ],
                ),
        ),
      ),
    );
  }

  // Shared text content for product cards.
  Widget productText(Map<String, String> product) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product['name'] ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: appPurple,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product['brand'] ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Rs. ${product['price'] ?? ''}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: appRed,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product['description'] ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Electronics Store',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: appYellow,
            unselectedLabelColor: appWhite,
            indicatorColor: appYellow,
            tabs: [
              Tab(
                icon: Icon(Icons.view_agenda),
                text: 'Vertical',
              ),
              Tab(
                icon: Icon(Icons.view_carousel),
                text: 'Horizontal',
              ),
              Tab(
                icon: Icon(Icons.grid_view),
                text: 'Grid',
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // 1. VERTICAL LIST
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return productCard(
                  products[index],
                  horizontal: true,
                );
              },
            ),

            // 2. HORIZONTAL LIST
            ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 280,
                  child: productCard(
                    products[index],
                    horizontal: true,
                  ),
                );
              },
            ),

            // 3. GRID VIEW
            GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.70,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return productCard(products[index]);
              },
            ),
          ],
        ),

        // CREATE PRODUCT BUTTON
        floatingActionButton: FloatingActionButton.extended(
          onPressed: createProduct,
          backgroundColor: appYellow,
          foregroundColor: Colors.black,
          icon: const Icon(Icons.add),
          label: const Text(
            'Create Product',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CREATE PRODUCT SCREEN
// ============================================================

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() =>
      _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController(
    text: 'tempimg.png',
  );

  @override
  void dispose() {
    nameController.dispose();
    brandController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  void saveProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final product = <String, String>{
      'name': nameController.text.trim(),
      'brand': brandController.text.trim(),
      'price': priceController.text.trim(),
      'description': descriptionController.text.trim(),
      'image': imageController.text.trim().isEmpty
          ? 'tempimg.png'
          : imageController.text.trim(),
    };

    Navigator.pop(context, product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(
                Icons.add_box,
                color: appPurple,
                size: 60,
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter product information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: appPurple,
                ),
              ),
              const SizedBox(height: 24),

              // PRODUCT NAME
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  prefixIcon: Icon(Icons.devices),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // BRAND
              TextFormField(
                controller: brandController,
                decoration: const InputDecoration(
                  labelText: 'Brand',
                  prefixIcon: Icon(Icons.business),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a brand';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // PRICE
              TextFormField(
                controller: priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Price (Rs.)',
                  prefixIcon: Icon(Icons.currency_exchange),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a price';
                  }

                  final price = double.tryParse(value.trim());

                  if (price == null || price < 0) {
                    return 'Enter a valid non-negative price';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),

              // DESCRIPTION
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // IMAGE PATH OR URL
              TextFormField(
                controller: imageController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  labelText: 'Image URL or asset path',
                  hintText: 'tempimg.png or https://...',
                  prefixIcon: Icon(Icons.image),
                  helperText:
                      'Use tempimg.png or provide an HTTP(S) image URL.',
                ),
                validator: (value) {
                  final image = value?.trim() ?? '';

                  if (image.isEmpty || image == 'tempimg.png') {
                    return null;
                  }

                  final uri = Uri.tryParse(image);

                  if (uri == null ||
                      !uri.hasScheme ||
                      !(uri.scheme == 'http' ||
                          uri.scheme == 'https') ||
                      uri.host.isEmpty) {
                    return 'Enter a valid HTTP(S) image URL or tempimg.png';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 28),

              // SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: saveProduct,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save Product',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appPurple,
                    foregroundColor: appWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT DETAIL SCREEN
// ============================================================

class DetailScreen extends StatelessWidget {
  final Map<String, String> product;

  const DetailScreen({
    super.key,
    required this.product,
  });

  Widget detailImage() {
    final path = product['image']?.trim() ?? '';

    Widget fallback() {
      return const ColoredBox(
        color: appYellow,
        child: Center(
          child: Icon(
            Icons.devices,
            color: appPurple,
            size: 80,
          ),
        ),
      );
    }

    if (path.startsWith('https://') ||
        path.startsWith('http://')) {
      return Image.network(
        path,
        width: 220,
        height: 220,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback(),
      );
    }

    final assetPath = path.isEmpty || path == 'tempimg.png'
        ? 'assets/tempimg.png'
        : path;

    return Image.asset(
      assetPath,
      width: 220,
      height: 220,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => fallback(),
    );
  }

  Widget detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: appPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value ?? '',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] ?? 'Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 240,
                height: 240,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: appYellow.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: detailImage(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Center(
              child: Text(
                product['name'] ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: appPurple,
                ),
              ),
            ),
            const SizedBox(height: 28),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appWhite,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: appPurple.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailRow('Brand', product['brand']),
                  detailRow('Price', 'Rs. ${product['price']}'),
                  detailRow(
                    'Description',
                    product['description'],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Products'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appRed,
                  foregroundColor: appWhite,
                  padding: const EdgeInsets.all(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
