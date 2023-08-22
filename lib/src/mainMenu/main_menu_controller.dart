import 'package:flutter/cupertino.dart';

class MainMenuController {
  BuildContext? context;
  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  Future<void> goReportPage() async {
    Navigator.pushNamed(context!, 'tyc');
  }
}
