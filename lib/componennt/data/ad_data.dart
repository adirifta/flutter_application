// ad_data.dart
class Advertisement {
  final String imageUrl;
  final String title;

  Advertisement({
    required this.imageUrl,
    required this.title,
  });
}

List<Advertisement> advertisements = [
  Advertisement(
    imageUrl: 'assets/img/iklan_1.jpg',
    title: 'Diskon Spesial!',
  ),
  Advertisement(
    imageUrl: 'assets/img/iklan_2.jpg',
    title: 'Promo Terbaru!',
  ),
  Advertisement(
    imageUrl: 'assets/img/iklan_3.jpg',
    title: 'Penawaran Hebat!',
  ),
];
