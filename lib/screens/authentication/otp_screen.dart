import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_thrift/widgets/authentication_scaffold.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  bool _isLoading = false;
  int remainingTime = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer
    _timer.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  //Rsesend OTP
  void _resendOtp() {
    if (remainingTime == 0) {
      print('Resending OTP...');
      setState(() {
        remainingTime = 60;
      });
      _startTimer();
    }
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String getEnteredOtp() {
    List<String> values =
        _otpControllers.map((controller) => controller.text).toList();
    print('OTP Values: $values');
    return values.join();
  }

  Future<void> _verifyOtp() async {
    String otp = getEnteredOtp();
    print('Entered OTP: $otp');

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Create PhoneAuthCredential
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      // Sign in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Verified!')),
      );

      // Navigate to home or the next screen
      Navigator.pushNamed(context, '/name');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error verifying OTP: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Phone number: ${widget.phoneNumber}");
    final String subtitletext = 'Please enter the 6-digit verification code sent to your mobile number +91-${widget.phoneNumber} via SMS';

    return AuthenticationScaffold(
      heading: 'Verify Mobile No.',
      subtitle: subtitletext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // OTP input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              6,
              (index) => SizedBox(
                width: 50,
                child: TextField(
                  controller: _otpControllers[index],
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Move to next field when a digit is entered
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),

          // Resend OTP
          Row(
            children: [
              const Text("Didn't receive OTP? "),
              GestureDetector(
                onTap: _resendOtp,
                child: Text(
                  remainingTime > 0
                      ? 'Resend OTP in ${formatTime(remainingTime)}'
                      : 'Resend OTP',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      buttonText: 'Verify OTP',
      onButtonPressed: _isLoading ? null : _verifyOtp,
    );
  }
}
