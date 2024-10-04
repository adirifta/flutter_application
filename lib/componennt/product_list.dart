import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: Image.asset('assets/img/detail_produk.png'),
          title: const Text('Another Product'),
          subtitle: const Text('Description of another product'),
          trailing: const Text('Rp100.000'),
        ),
        ListTile(
          leading: Image.asset('assets/img/detail_produk.png'),
          title: const Text('Another Product'),
          subtitle: const Text('Description of another product'),
          trailing: const Text('Rp100.000'),
        ),
        // Add more ListTiles or widgets as needed
      ],
    );
  }
}
