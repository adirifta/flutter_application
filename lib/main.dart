import 'package:flutter/material.dart';
import 'package:flutter_application/home_page.dart';
import 'onboarding_screen.dart';
import 'product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/productDetail': (context) => const ProductDetailPage(),
      },
    );
  }
}
