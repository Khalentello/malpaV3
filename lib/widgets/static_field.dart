import 'package:flutter/material.dart';

class StaticTextField extends StatelessWidget {
  final String staticText;
  final double fontSize;
  const StaticTextField(
      {super.key, required this.staticText, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      staticText,
      style: TextStyle(
          fontSize: fontSize, color: Colors.white, fontWeight: FontWeight.w400),
    );
  }
}
