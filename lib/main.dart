import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ShoeStoreApp());
}

class ShoeStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
