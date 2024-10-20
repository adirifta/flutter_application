import 'package:flutter/material.dart';
import 'package:flutter_application/componennt/page/bottom_navbar.dart';
import 'package:flutter_application/componennt/page/home_page.dart';
import 'componennt/onboarding/onboarding_screen.dart';
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
        '/bottomNavbar': (context) => const BottomNavbar(),
      },
    );
  }
}
