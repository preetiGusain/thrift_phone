import 'package:flutter/material.dart';

class AuthenticationScaffold extends StatelessWidget {
  final String heading;
  final String subtitle;
  final Widget content;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onClosePressed;

  const AuthenticationScaffold({
    super.key,
    required this.heading,
    required this.subtitle,
    required this.content,
    required this.buttonText,
    this.onButtonPressed,
    this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: onClosePressed ?? () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ),

                const SizedBox(height: 60),

                // Title and subtitle
                const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Thrift',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          letterSpacing: 6.0,
                          height: 0.5,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'PHONE',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),

                // Heading and subtitle
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        heading,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 2, 53, 95),
                          letterSpacing: 1.0,
                          height: 2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 80),

                // Page-specific content
                content,

                const SizedBox(height: 60),

                // Next button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 53, 95),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
