import 'package:flutter/cupertino.dart';

class MainMenuController {
  BuildContext? context;
  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  Future<void> goReportPage() async {
    Navigator.pushNamed(context!, 'reportPage');
  }

  Future<void> goMyInfractions() async {
    debugPrint('Aun no existe la pagina');
  }

  Future<void> goCourse() async {
    debugPrint('Aun no existe la pagina');
  }
}
