import 'package:flutter/material.dart';
import 'package:flutter_application/home_page.dart';
import 'componennt/onboarding/onboarding_screen.dart';
import 'componennt/product/product_detail_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/homepage': (context) => const HomePage(),
        '/productDetail': (context) => const ProductDetailPage(),
      },
    );
  }
}