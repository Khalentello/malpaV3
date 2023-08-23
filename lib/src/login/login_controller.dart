import 'package:flutter/material.dart';
import 'package:malpav3/src/models/user.dart';
import 'package:malpav3/src/providers/auth_provider.dart';
import 'package:malpav3/src/providers/user_provider.dart';

class LoginController {
  BuildContext? context;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthProvider? _authProvider;
  UserProvider? _userProvider;
  void init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _userProvider = UserProvider();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      final bool isLogin = await _authProvider!.login(email, password);
      debugPrint('### ISLOGIN ES: $isLogin ##');
      if (email.isEmpty || password.isEmpty) {
        debugPrint('### NINGUN CAMPO DEBE IR VACIO ##');
      } else if (isLogin) {
        final UserApp? user =
            await _userProvider!.getByIdUserApp(_authProvider!.getUser()!.uid);
        debugPrint('### USER ES: ${user?.id} ##');
        if (user != null) {
          Navigator.pushNamedAndRemoveUntil(
              context!, 'report/event', (route) => false);
        } else {
          debugPrint('### EL USUARIO NO ES VALIDO ##');
        }
      } else {
        debugPrint('### EL USUARIO NO ES VALIDO ##');
        _authProvider!.signOut();
      }
    } catch (e) {
      debugPrint('### ERROR EN EL METODO LOGIN LOGINCONTROLLER $e ##');
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }
}
