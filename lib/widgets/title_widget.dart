import 'package:flutter/material.dart';

class ThriftTitle extends StatelessWidget {
  final double fontSize;
  final Color color;

  const ThriftTitle({
    Key? key,
    this.fontSize = 20,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thrift',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: color,
          ),
        ),
        Text(
          'PHONE',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSize * 0.4,
            letterSpacing: 8.0,
            color: color,
          ),
        ),
      ],
    );
  }
}
