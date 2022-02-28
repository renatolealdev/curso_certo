import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final bannerCardCurrent;
  const BannerCard({Key? key, required this.bannerCardCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(bannerCardCurrent),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
