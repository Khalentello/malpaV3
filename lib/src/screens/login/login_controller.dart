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
  bool loginError = false;
  void init(BuildContext context) {
    this.context = context;
    loginError = false;
    _authProvider = AuthProvider();
    _userProvider = UserProvider();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    final bool isLogin = await _authProvider!.login(email, password);
    // debugPrint('### IsLOGIN ES: $isLogin ##');
    if (email.isEmpty || password.isEmpty) {
      // debugPrint('### NINGÚN CAMPO DEBE IR VACIÓ ##');
      loginError = true;
    } else if (isLogin) {
      final UserApp? user =
          await _userProvider!.getByIdUserApp(_authProvider!.getUser()!.uid);
      // debugPrint('### USER ES: ${user?.id} ##');
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(
          context!,
          'report/event',
          (route) => false,
        );
      } else {
        debugPrint('### EL USUARIO NO ES VALIDO ##');
        loginError = true;
      }
    } else {
      debugPrint('### EL USUARIO NO ES VALIDO ##');
      _authProvider!.signOut();
      loginError = true;
    }
  }

  void goResetPassword() {
    Navigator.pushNamed(context!, 'resetPassword');
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }
}
