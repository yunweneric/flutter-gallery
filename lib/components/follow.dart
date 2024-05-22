import 'package:flutter/material.dart';
import 'package:flutter_gallery/utils/colors.dart';
import 'package:flutter_gallery/utils/helper.dart';
import 'package:flutter_gallery/utils/sizing.dart';
import 'package:flutter_svg/svg.dart';

class Link {
  final int index;
  final String url;
  final String icon;
  final String title;

  Link(this.index, this.icon, this.url, this.title);
}

class Follow extends StatelessWidget {
  Follow({super.key});

  List<Link> links = [
    Link(0, "github", "https://github.com/yunweneric/", "Github"),
    Link(1, "x", "https://twitter.com/yunweneric", "X"),
    Link(2, "linkedIn", "https://www.linkedin.com/in/yunweneric", "LinkedIn"),
  ];

  linkItem(Link link, BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        fixedSize: const Size(120, 35),
      ),
      onPressed: () => Helper.navigate(link.url),
      label: Text(link.title, style: const TextStyle(color: AppColors.black)),
      icon: SvgPicture.asset("assets/icons/${link.icon}.svg"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: Sizing.width(context) / 3,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...links.map((link) {
              return linkItem(link, context);
            })
          ],
        ),
      ),
    );
  }
}
