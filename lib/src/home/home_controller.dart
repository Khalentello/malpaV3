import 'package:flutter/cupertino.dart';
import 'package:malpav3/src/provider/auth_provider.dart';
import 'package:malpav3/src/utils/utils.dart';

class HomeController {
  BuildContext? context;
  final TextEditingController emailCapture = TextEditingController();
  final TextEditingController passwordCaptura = TextEditingController();
  AuthProvider? _authProvider;
  void init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
  }

  Future<void> login() async {
    String email = emailCapture.text.trim();
    String password = passwordCaptura.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackBar("Ingrese su correo y contraseña", context!);
    } else {
      String loginStatus = await _authProvider!.login(email, password);
      if (loginStatus == "Inicio Correcto") {
        Navigator.pushNamed(context!, "mainMenu");
        showSnackBar("Inicio Correcto", context!);
      } else {
        showSnackBar(loginStatus, context!);
      }
    }
  }

  Future<void> goRegisterPage() async {
    Navigator.pushNamed(context!, 'register');
  }
}
