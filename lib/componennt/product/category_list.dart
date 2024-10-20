import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Sepatu Pria', 'icon': 'assets/icons/mens_shoes.png'},
    {'name': 'Sepatu Wanita', 'icon': 'assets/icons/womens_shoes.png'},
    {'name': 'Sepatu Anak', 'icon': 'assets/icons/kids_shoes.png'},
    {'name': 'Sepatu Olahraga', 'icon': 'assets/icons/sport_shoes.png'},
    {'name': 'Sepatu Kasual', 'icon': 'assets/icons/casual_shoes.png'},
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            'Kategori',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Adjust the padding based on the screen width
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width > 600 ? 20.0 : 0.0),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF629584),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              category['icon']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
