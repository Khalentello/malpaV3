//crear widget para los campos de texto

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPass;
  final int icon;
  final TextInputType textInputType;
  final int textInputLength;
  const TextInputField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.isPass = false,
    required this.icon,
    required this.textInputType,
    this.textInputLength = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
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
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          suffixIcon: Icon(
            _iconsList[icon].icon,
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
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
  IconList(Icons.mark_email_unread),
  IconList(Icons.phone_android),
  IconList(Icons.lock),
  IconList(Icons.person),
  IconList(Icons.car_crash),
];
