import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_thrift/screens/authentication/otp_screen.dart';
import 'package:phone_thrift/widgets/authentication_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTermsAccepted = false;
  String phoneNumber = '';
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void _sendOtp() async {
    String fullPhoneNumber = '+91${phoneController.text.trim()}';
    if (!isTermsAccepted || phoneController.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number.')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to OTP screen with the verification ID
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationId: verificationId,
                phoneNumber: fullPhoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      heading: 'Welcome',
      subtitle: 'sign in to continue',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '+91',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        width: 1,
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Mobile Number',
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                          ),
                          onChanged: (value) {
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

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
        ],
      ),
      buttonText: 'Next',
      onButtonPressed:
          (isTermsAccepted && phoneNumber.length == 10) ? _sendOtp : null,
    );
  }
}
