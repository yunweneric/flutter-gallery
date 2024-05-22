import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/components/follow.dart';
import 'package:flutter_gallery/components/gallery_card.dart';
import 'package:flutter_gallery/model/gallery_item.dart';
import 'package:flutter_gallery/utils/sizing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GalleryItem> galleryItems = [
    GalleryItem(
      title: 'My personal delusions',
      date: "January 2024",
      images: List.generate(3, (index) => "assets/images/0_$index.png").toList(),
    ),
    GalleryItem(
      title: 'My personal delusions',
      date: "January 2024",
      images: List.generate(3, (index) => "assets/images/1_$index.png").toList(),
    ),
    GalleryItem(
      title: 'My personal delusions',
      date: "January 2024",
      images: List.generate(3, (index) => "assets/images/2_$index.png").toList(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        height: Sizing.height(context),
        width: Sizing.width(context),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...galleryItems.map((gallery) => GalleryCard(gallery: gallery))],
              ),
            ),
            Positioned(
              bottom: 20,
              left: Sizing.width(context) / 3,
              right: Sizing.width(context) / 3,
              child: Follow(),
            ),
          ],
        ),
      ),
    );
  }
}
