class GalleryItem {
  final String title;
  final String date;
  final List<String> images;

  GalleryItem({required this.title, required this.date, required this.images});
}

class HeroItem {
  final int index;
  final int tag;

  HeroItem({required this.index, required this.tag});
}
