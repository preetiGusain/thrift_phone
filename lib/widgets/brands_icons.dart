import 'package:flutter/material.dart';

Widget brandLogo(String imagePath) {
  return Container(
    width: 65,
    height: 65,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      shape: BoxShape.circle,
    ),
    padding: const EdgeInsets.all(8),
    child: Image.asset(
      imagePath,
      fit: BoxFit.contain,
    ),
  );
}
