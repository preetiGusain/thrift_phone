import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Thrift',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 16,
                ),
                const SizedBox(width: 4),
                const Text(
                  'India',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16), // Space between location and Logout
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    //Login
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Content goes here'),
      ),
    );
  }
}
