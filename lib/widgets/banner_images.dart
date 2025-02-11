import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildImage(String bannerImage, int index) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 1.0),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      bannerImage,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  ),
);

Widget buildIndicator(int activeIndex, int itemCount) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: itemCount,
    effect: const JumpingDotEffect(
      dotHeight: 8,
      dotWidth: 8,
      dotColor: Color.fromARGB(255, 206, 204, 204),
      activeDotColor: Colors.black,
    ),
  );
}
  

