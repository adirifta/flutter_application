import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import '../data/onboarding_data.dart';

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
      title: 'Gratis Tips Menjadi Penjual Sepatu Sukses',
      subtitle:
          'Belum bisa jualan sepatu? Jangan khawatir, kami akan membimbingmu untuk menjadi penjual sepatu handal dengan panduan dari para ahli.',
    ),
    OnboardingData(
      imagePath: 'assets/img/onboarding_2.jpg',
      title: 'Koleksi Sepatu Berkualitas Tinggi',
      subtitle:
          'Kami menyediakan berbagai jenis sepatu berkualitas dari penjual terpercaya.',
    ),
    OnboardingData(
      imagePath: 'assets/img/onboarding_3.jpg',
      title: 'Toko Sepatu Online Unik untuk Bisnismu',
      subtitle:
          'Toko sepatu online dengan desain profesional siap digunakan untuk jualan!',
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
          Expanded(
            child: PageView.builder(
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
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            right: 16,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/bottomNavbar');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.6),
                      blurRadius: 9.0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Lewati',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            top: 240,
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
                        ? const Color(0xff243642)
                        : const Color.fromARGB(255, 153, 153, 153),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: 16,
            right: 16,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == onboardingData.length - 1) {
                    Navigator.pushReplacementNamed(context, '/bottomNavbar');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff387478),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  currentIndex == onboardingData.length - 1
                      ? 'Mulai'
                      : 'Selanjutnya',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
