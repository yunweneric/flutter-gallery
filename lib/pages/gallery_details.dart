import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/model/gallery_item.dart';
import 'package:flutter_gallery/utils/colors.dart';
import 'package:flutter_gallery/utils/sizing.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryDetails extends StatefulWidget {
  final List<HeroItem> tags;
  const GalleryDetails({super.key, required this.tags});

  @override
  State<GalleryDetails> createState() => _GalleryDetailsState();
}

class _GalleryDetailsState extends State<GalleryDetails> {
  @override
  Widget build(BuildContext context) {
    // print(widget.tags);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text("My Personal Delusions", style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 5),
                  Text("Last Edited: January 2024", style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 20),
                  StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.5,
                        child: Tile(item: widget.tags[0]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.0,
                        child: Tile(item: widget.tags[1]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Tile(item: widget.tags[2]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 0.8,
                        child: Tile(item: widget.tags[3]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Tile(item: widget.tags[4]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Tile(item: widget.tags[5]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.7,
                        child: Tile(item: widget.tags[6]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.7,
                        child: Tile(item: widget.tags[7]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 100,
              width: Sizing.width(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.gray, width: 0.2),
                    ),
                    padding: EdgeInsets.all(8),
                    child: const Icon(Icons.arrow_back, color: AppColors.white),
                  ),
                ),
                SizedBox(
                  width: Sizing.width(context) / 3,
                  child: CupertinoSearchTextField(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    prefixIcon: Icon(Icons.search, color: AppColors.white),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.gray, width: 0.2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final HeroItem item;
  const Tile({super.key, required this.item});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool hasHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (hovered) {
        setState(() => hasHovered = hovered);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: hasHovered ? 1.01 : 1.0,
        child: Hero(
          tag: widget.item.tag,
          flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(begin: 0, end: 0.98).chain(CurveTween(curve: Curves.elasticInOut)),
                  ),
                  child: toHeroContext.widget,
                );
              case HeroFlightDirection.push:
                return toHeroContext.widget;
              default:
                return toHeroContext.widget;
            }
          },
          // child: Image.asset("assets/images/0_${widget.item.index}.png", fit: BoxFit.cover),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("assets/images/0_${widget.item.index}.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
