import 'package:flutter/material.dart';
import 'package:malpav3/src/utils/colors_generic.dart';

class StaticTextRegister extends StatelessWidget {
  const StaticTextRegister({
    super.key,
    required this.staticText,
  });
  final String staticText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        staticText,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: blackColor,
        ),
      ),
    );
  }
}
