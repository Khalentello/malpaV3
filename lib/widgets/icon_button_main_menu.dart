import 'package:flutter/material.dart';

class IconButtonMainMenu extends StatelessWidget {
  final String buttonText;
  final int icon;
  final bool isActive;
  final Future functionName;

  const IconButtonMainMenu({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.functionName,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isActive ? () => functionName : null,
        icon: Icon(
          _iconsList[icon].icon,
          size: 50,
        ),
        label: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
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
  IconList(Icons.report),
  IconList(Icons.pageview),
  IconList(Icons.class_),
];
