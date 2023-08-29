//crear widget para los campos de texto

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malpav3/src/utils/colors_generic.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPass;
  final int icon;
  final TextInputType textInputType;
  final int textInputLength;
  final double marginBottom;
  final double marginTop;
  final bool withIcon;

  const TextInputField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.isPass = false,
    this.withIcon = false,
    required this.icon,
    required this.textInputType,
    this.textInputLength = 100,
    required this.marginBottom,
    required this.marginTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: marginBottom,
        top: marginTop,
      ),
      // Valor
      child: TextField(
        controller: textEditingController,
        obscureText: isPass,
        keyboardType: textInputType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(textInputLength),
          if (textInputLength == 10) FilteringTextInputFormatter.digitsOnly,
        ],
        // Propiedades estéticas
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: hintTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: withIcon
              ? Icon(
                  _iconsList[icon].icon,
                  color: buttonColor,
                )
              : null,
          suffixIcon: isPass
              ? Icon(
                  Icons.remove_red_eye_outlined,
                  color: blackColor,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}

class IconList {
  IconData icon;
  IconList(this.icon);
}

List<IconList> _iconsList = [
  IconList(Icons.email_outlined),
  IconList(Icons.phone_android),
  IconList(Icons.lock_outline_rounded),
  IconList(Icons.person),
  IconList(Icons.car_crash),
];
