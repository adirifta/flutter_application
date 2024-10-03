import 'package:flutter/material.dart';
import '../models/shoe.dart';

class DetailScreen extends StatefulWidget {
  final Shoe shoe;

  DetailScreen({required this.shoe});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shoe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.shoe.imageUrl),
            const SizedBox(height: 16.0),
            Text(
              widget.shoe.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(widget.shoe.description),
            const SizedBox(height: 16.0),
            Text('Price: \$${widget.shoe.price}'),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Quantity:'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text('$quantity'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika pemesanan sepatu
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Order Confirmation'),
                    content: Text('You ordered $quantity of ${widget.shoe.name}.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}