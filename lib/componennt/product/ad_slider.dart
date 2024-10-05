import 'dart:async';
import 'package:flutter/material.dart';
import '../data/ad_data.dart';

class AdSlider extends StatefulWidget {
  const AdSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdSliderState createState() => _AdSliderState();
}

class _AdSliderState extends State<AdSlider> {
  // ignore: prefer_final_fields
  PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < advertisements.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight;
        if (constraints.maxWidth < 600) {
          imageHeight = 180; // Mobile size
        } else if (constraints.maxWidth < 900) {
          imageHeight = 300; // Tablet size
        } else {
          imageHeight = 600; // Desktop size
        }

        return Column(
          children: [
            SizedBox(
              height: imageHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: advertisements.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildAdItem(advertisements[index], imageHeight);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(advertisements.length, (index) {
                return _buildIndicator(index == _currentPage);
              }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAdItem(Advertisement ad, double height) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(ad.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ad.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              backgroundColor: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF387478) : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
