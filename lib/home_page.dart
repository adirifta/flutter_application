import 'package:flutter/material.dart';
import 'package:flutter_application/componennt/product/ad_slider.dart';
import 'componennt/product/product_detail_page.dart';
import 'componennt/product/product_card.dart';
import 'componennt/data/product_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF629584),
        elevation: 4,
        title: const Row(
          children: [
            Text(
              'Produk Terbaru',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFEFEFEF),
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine layout based on screen width
            if (constraints.maxWidth < 600) {
              // Mobile layout
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const AdSlider(),
                    _buildRecommendations(context),
                    _buildProductGrid(context, 2), // 2 columns for mobile
                  ],
                ),
              );
            } else if (constraints.maxWidth < 900) {
              // Tablet layout
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const AdSlider(),
                    _buildRecommendations(context),
                    _buildProductGrid(context, 3), // 3 columns for tablet
                  ],
                ),
              );
            } else {
              // Desktop layout
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const AdSlider(),
                    _buildRecommendations(context),
                    _buildProductGrid(context, 4), // 4 columns for desktop
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Rekomendasi Produk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDetailPage(),
                      ),
                    );
                  },
                  child: HorizontalProductCard(
                    name: product['name'],
                    price: product['price'],
                    oldPrice: product['oldPrice'],
                    imageUrl: product['image'],
                    stock: product['stock'],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context, int columns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Produk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
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
        const SizedBox(height: 50),
      ],
    );
  }
}
