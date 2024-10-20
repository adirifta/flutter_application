import 'package:flutter/material.dart';
import 'package:flutter_application/componennt/data/product_data.dart';
import 'package:flutter_application/componennt/product/product_detail_page.dart';

class ProductList extends StatelessWidget {
  final int productId;

  const ProductList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> relatedProducts =
        products.where((product) => product['id'] != productId).toList();

    final List<Map<String, dynamic>> limitedProducts =
        relatedProducts.take(2).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: limitedProducts.length,
      itemBuilder: (context, index) {
        final product = limitedProducts[index];
        return Card(
          elevation: 4,
          color: const Color(0xFFEFEFEF),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(productId: product['id']),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product['image'],
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product['description'],
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product['price'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(
                                0xFF629584),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
