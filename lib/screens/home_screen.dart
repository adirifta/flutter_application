import 'package:flutter/material.dart';
import '../models/shoe.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe(
      name: 'Nike Air Max',
      description: 'Comfortable and stylish sneakers.',
      imageUrl: 'https://example.com/nike_air_max.jpg',
      price: 99.99,
    ),
    Shoe(
      name: 'Adidas Ultra Boost',
      description: 'Running shoes with great support.',
      imageUrl: 'https://example.com/adidas_ultra_boost.jpg',
      price: 119.99,
    ),
    // Tambahkan sepatu lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Store'),
      ),
      body: ListView.builder(
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          final shoe = shoes[index];
          return Card(
            child: ListTile(
              leading: Image.network(shoe.imageUrl, width: 50, height: 50),
              title: Text(shoe.name),
              subtitle: Text('\$${shoe.price}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(shoe: shoe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}