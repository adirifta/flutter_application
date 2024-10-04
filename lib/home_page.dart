import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of products
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Beauty Set by Irvie',
        'price': 'Rp142.400',
        'oldPrice': 'Rp178.000',
        'image': 'assets/img/detail_produk.png',
        'stock': 'Stok: 99+ pcs',
      },
      {
        'name': 'Gadget X',
        'price': 'Rp1.500.000',
        'oldPrice': 'Rp1.750.000',
        'image': 'assets/img/detail_produk.png',
        'stock': 'Stok: 50 pcs',
      },
      {
        'name': 'Smartwatch Z',
        'price': 'Rp850.000',
        'oldPrice': 'Rp1.000.000',
        'image': 'assets/img/detail_produk.png',
        'stock': 'Stok: 10 pcs',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produk Terbaru',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Add cart functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 products per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Navigate to product detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailPage(),
                  ),
                );
              },
              child: ProductCard(
                name: product['name'],
                price: product['price'],
                oldPrice: product['oldPrice'],
                imageUrl: product['image'],
                stock: product['stock'],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Custom widget for displaying a product card
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String oldPrice;
  final String imageUrl;
  final String stock;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  stock,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
