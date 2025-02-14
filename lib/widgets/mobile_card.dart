import 'package:flutter/material.dart';

class MobileCard extends StatelessWidget {
  final Map<String, dynamic> mobile;

  const MobileCard({Key? key, required this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Image.network(
            mobile["image"] ?? "",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mobile["name"] ?? "Unknown",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                mobile["price"] ?? "N/A",
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}