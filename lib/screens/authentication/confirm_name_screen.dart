import 'package:flutter/material.dart';
import 'package:phone_thrift/widgets/authentication_scaffold.dart';

class ConfirmNameScreen extends StatelessWidget {
  ConfirmNameScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      heading: 'Welcome',
      subtitle: 'Sign up to continue',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name label
          const Text(
            'Please tell us your name',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, height: 0.5),
          ),

          const SizedBox(height: 10),

          // Name input
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
        ],
      ),
      buttonText: 'Confirm Name',
      onButtonPressed: () {
        if (nameController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter your name.'),
            ),
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => false,
          );
        }
      },
    );
  }
}
