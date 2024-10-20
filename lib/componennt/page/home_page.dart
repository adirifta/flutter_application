import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/componennt/product/ad_slider.dart';
import '../product/category_list.dart';
import '../product/product_detail_page.dart';
import '../product/product_card.dart';
import '../data/product_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF629584),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: const Color(0xFFEFEFEF),
        child: Column(
          children: [
            _buildCustomHeader(),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenSize.width <
                                600 // Assuming 600px is a threshold for mobile
                            ? screenSize.height * 0.25 // Mobile
                            : screenSize.height * 0.89, // Browser
                        child: const AdSlider(),
                      ),
                      const SizedBox(height: 10), // Added some spacing
                      CategoryList(),
                      _buildRecommendations(context),
                      _buildProductGrid(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF629584),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              const SizedBox(width: 8),
              const Text(
                'Mojokerto, Indonesia',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Color(0xFF629584)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xFF629584),
                  ),
                  onPressed: () {
                    // Handle filter action
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context) {
    final filteredProducts = products
        .where((product) => product['id'] >= 4 && product['id'] <= 6)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
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
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(productId: product['id']),
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

  Widget _buildProductGrid(BuildContext context) {
    final filteredProducts = products
        .where((product) => product['id'] >= 1 && product['id'] <= 6)
        .toList();

    // Determine number of columns based on screen size
    int columns = (MediaQuery.of(context).size.width / 200)
        .floor(); // Adjust this number based on the desired width for each item

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
        const SizedBox(height: 8.0),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.7,
          ),
          itemCount: filteredProducts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(productId: product['id']),
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
