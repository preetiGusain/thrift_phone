import 'package:flutter/material.dart';

Widget drawerIcons(IconData icon, String label) {
  return Container(
    width: 90,
    height: 60,
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 201, 197, 197)),
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 25,
          color: Colors.black,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
