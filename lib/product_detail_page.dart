import 'package:flutter/material.dart';
import 'componennt/color_option.dart';
import 'componennt/product_list.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                child: Image.asset(
                  'assets/img/detail_produk.png',
                  fit: BoxFit.cover,
                  height: 350,
                  width: double.infinity,
                ),
              ),
            ),

            // Product Details
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    color: const Color.fromARGB(255, 255, 204,
                        73),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'NEW ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Product Baru',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Beauty Set by Irvie',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Irvie group official',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16.0),

                  // Pricing
                  const Row(
                    children: [
                      Text(
                        'Rp178.000',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Rp142.400',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Komisi Rp35.600 (20%)',
                    style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 16.0),

                  // Size Options
                  const Text(
                    'Ukuran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      ChoiceChip(
                        label: const Text('Paket 1'),
                        selected: true,
                        onSelected: (bool selected) {},
                      ),
                      const SizedBox(width: 8.0),
                      ChoiceChip(
                        label: const Text('Paket 2'),
                        selected: false,
                        onSelected: (bool selected) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Color Options
                  const Text(
                    'Warna',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  const Row(
                    children: [
                      ColorOption(Colors.brown),
                      SizedBox(width: 8.0),
                      ColorOption(Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Stock Info
                  const Text(
                    'Stok: 99+ pcs',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16.0),

                  // Product Description
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '*New Material*\nTersbuat dari bahan 100% Katun Linen yang membuat nyaman dipakai.\nMenggunakan fit Relaxed Fit.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'SIZE CHART RELAXED SHIRT...',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  const SizedBox(height: 16.0),

                  // Other Products Section
                  const Text(
                    'Produk lain dari Irvie group official',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  const ProductList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  // Implement add to store functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Tambahkan ke toko',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Implement add to cart functionality
                },
                // ignore: sort_child_properties_last
                child: const Icon(Icons.shopping_cart, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 5, 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
