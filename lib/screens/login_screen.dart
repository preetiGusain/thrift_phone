import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTermsAccepted = false;

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
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
          
                const SizedBox(height: 60),
                // Title
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
                const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 2, 53, 95),
                          letterSpacing: 4.0,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 80),
          
                // Phone number label
                const Text(
                  'Enter your phone number',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500, height: 0.5),
                ),
          
                const SizedBox(height: 10),
          
                // Phone number input
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                '+91',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              width: 1,
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Mobile Number',
                                  border: InputBorder.none,
                                  counterText: '',
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 60),
          
                // Terms and conditions
                Row(
                  children: [
                    Checkbox(
                      value: isTermsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          isTermsAccepted = value ?? false;
                        });
                      },
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Accept '),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 5),
          
                // Next button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isTermsAccepted ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isTermsAccepted
                          ? const Color.fromARGB(255, 2, 53, 95)
                          : Colors.grey, // Button color
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
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
