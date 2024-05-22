import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gallery/model/gallery_item.dart';
import 'package:flutter_gallery/pages/gallery_details.dart';
import 'package:flutter_gallery/utils/sizing.dart';
import 'package:flutter_svg/svg.dart';

class GalleryCard extends StatefulWidget {
  final GalleryItem gallery;
  const GalleryCard({super.key, required this.gallery});

  @override
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> {
  bool hasHovered = false;

  final duration = const Duration(milliseconds: 300);
  final items = List.generate(7, (index) => index);
  List<HeroItem> randomList = [];
  Random random = Random();
  @override
  void initState() {
    setState(() {
      randomList = List.generate(8, (index) => HeroItem(index: index, tag: random.nextInt(10000)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onHover: (status) {
        setState(() => hasHovered = status);
      },
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            reverseTransitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => GalleryDetails(tags: randomList),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutBack)),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        width: Sizing.width(context) / 3.6,
        height: Sizing.height(context) / 2.5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: AnimatedScale(
                alignment: Alignment.centerLeft,
                duration: duration,
                scale: hasHovered ? 0.8 : 1,
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  width: Sizing.width(context) / 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.gallery.title, style: Theme.of(context).textTheme.displayMedium),
                      const SizedBox(height: 10),
                      Text("Last Edited ${widget.gallery.date}", style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    AnimatedScale(
                      duration: duration,
                      scale: hasHovered ? 1.2 : 1,
                      child: SvgPicture.asset(
                        "assets/icons/play.svg",
                        width: 35,
                        color: hasHovered ? Theme.of(context).primaryColor : null,
                      ),
                    ),
                    AnimatedScale(
                      duration: duration,
                      scale: hasHovered ? 0.8 : 1,
                      child: SvgPicture.asset("assets/icons/more.svg", width: 35),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: duration,
              right: hasHovered ? 0 : -100,
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomRight,
                height: Sizing.height(context) / 6,
                width: Sizing.width(context) / 4,
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Builder(builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ...randomList.map((item) => heroItem(index: item.index, tag: item.tag)),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget heroItem({required int index, required int tag}) {
    double value = 1 - (155.0 * index);
    final scaleFactor = 0.2 * index + 1;
    String image = "assets/images/0_$index.png";
    return AnimatedScale(
      duration: duration,
      scale: index > 3 ? 0 : 1,
      child: Hero(
        tag: tag,
        child: AnimatedScale(
          scale: hasHovered ? 0.02 * index + 1 : 1,
          duration: duration,
          child: AnimatedRotation(
            turns: hasHovered ? 0.01 * index + 1 : 1,
            duration: duration,
            child: Transform(
              alignment: Alignment.bottomRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..translate(0.0, value)
                ..scale(scaleFactor),
              child: Container(
                width: 180,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
