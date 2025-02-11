import 'package:flutter/material.dart';

Widget quickLinks(String imagePath, String label) {
  return SizedBox(
    width: 100,
    child: SizedBox(
      width: 100,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
              maxLines: 2,
            ),
          )
        ],
      )
    )
  );
}