import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'onboarding_data.dart';
// ignore: unused_import
import 'product_detail_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      imagePath: 'assets/img/onboarding_1.jpg',
      title: 'Gratis Materi Belajar Menjadi Seller Handal',
      subtitle:
          'Nggak bisa jualan? Jangan khawatir, Tokomare akan membimbing kamu hingga menjadi seller langsung dari ahlinya.',
    ),
    OnboardingData(
      imagePath: 'assets/img/onboarding_2.png',
      title: 'Ribuan Produk dengan Kualitas Terbaik',
      subtitle:
          'Tokomare menyediakan ribuan produk dengan kualitas terbaik dari seller terpercaya.',
    ),
    OnboardingData(
      imagePath: 'assets/img/onboarding_3.png',
      title: 'Toko Online Unik Untuk Kamu Jualan',
      subtitle: 'Sudut-sudut unik dan toko online profesional siap pakai!',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                data: onboardingData[index],
              );
            },
          ),
          Positioned(
            top: 50,
            right: 16,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/homepage');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              child: const Text(
                'Lewati',
              ),
            ),
          ),
          Positioned(
            bottom: 300,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: currentIndex == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == onboardingData.length - 1) {
                  Navigator.pushReplacementNamed(context, '/homepage');
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                currentIndex == onboardingData.length - 1
                    ? 'Mulai'
                    : 'Selanjutnya',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
