import 'package:flutter/material.dart';
import 'package:malpav3/src/models/user.dart';
import 'package:malpav3/src/providers/auth_provider.dart';
import 'package:malpav3/src/providers/user_provider.dart';

class RegisterController {
  BuildContext? context;
  final TextEditingController nameUser = TextEditingController();
  final TextEditingController phoneUser = TextEditingController();
  final TextEditingController emailUser = TextEditingController();
  final TextEditingController passwordUser = TextEditingController();
  final TextEditingController repeatPasswordUser = TextEditingController();
  AuthProvider? _authProvider;
  UserProvider? _userProvider;
  bool isTyCCheck = false;

  void init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _userProvider = UserProvider();
  }

  Future<void> showTyC() async {
    Navigator.pushNamed(context!, 'tyc');
  }

  Future<void> goLogin() async {
    Navigator.pushNamed(context!, 'login');
  }

  Future<void> registerUser() async {
    String name = nameUser.text;
    String phone = phoneUser.text.trim();
    String email = emailUser.text.trim();
    String password = passwordUser.text.trim();
    String passwordConfirm = repeatPasswordUser.text.trim();
    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordConfirm.isEmpty) {
      debugPrint('### NINGUNA CASILLA DEBE IR VACÍA ####');
    } else if (password != passwordConfirm) {
      debugPrint('### LAS CONTRASEÑAS DEBEN IR IGUALES ####');
    } else if (password.length < 6 || passwordConfirm.length < 6) {
      debugPrint('### LAS CONTRASEÑAS DEBEN SER MAYORES A 6 CARACTERES ####');
    } else if (!isTyCCheck) {
      debugPrint('### ACEPTA TÉRMINOS Y CONDICIONES ####');
    } else {
      try {
        bool isRegister = await _authProvider!.register(email, password);
        if (isRegister) {
          final UserApp user = UserApp(
            id: _authProvider!.getUser()!.uid,
            user: name,
            phone: phone,
            email: email,
            password: 'Reserved for the user',
          );
          await _userProvider!.createUser(user);
          Navigator.pushNamed(context!, 'report/event');
        }
      } catch (e) {
        debugPrint('### ERROR REGISTER USER REGISTER CONTROLLER $e ####');
      }
    }
  }
}
