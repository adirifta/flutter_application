import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import '../data/onboarding_data.dart';
// ignore: unused_import
import '../product/product_detail_page.dart';

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
    // ignore: unused_local_variable
    bool isWideScreen = MediaQuery.of(context).size.width > 800;
    // ignore: unused_local_variable
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          return Stack(
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
                    Navigator.pushReplacementNamed(context, '/bottomNavbar');
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
                bottom: isWideScreen ? 60 : 300,
                left: isWideScreen ? 190 : 0,
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
                bottom: 50,
                left: isWideScreen ? null : 16,
                right: isWideScreen ? 50 : 16,
                child: Align(
                  alignment:
                      isWideScreen ? Alignment.centerRight : Alignment.center,
                  child: SizedBox(
                    width: isWideScreen ? 200 : null,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex == onboardingData.length - 1) {
                          Navigator.pushReplacementNamed(
                              context, '/bottomNavbar');
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
                        minimumSize:
                            Size(isWideScreen ? 200 : double.infinity, 50),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
