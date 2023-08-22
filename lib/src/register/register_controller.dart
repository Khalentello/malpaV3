import 'package:flutter/cupertino.dart';
import 'package:malpav3/src/models/user.dart';
import 'package:malpav3/src/provider/auth_provider.dart';
import 'package:malpav3/src/provider/user_provider.dart';
import 'package:malpav3/src/utils/utils.dart';

class RegisterController {
  BuildContext? context;
  final TextEditingController nameCaptura = TextEditingController();
  final TextEditingController emailCaptura = TextEditingController();
  final TextEditingController phoneCaptura = TextEditingController();
  final TextEditingController passwordCaptura = TextEditingController();
  final TextEditingController passwordConfirmationCaptura =
      TextEditingController();
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

  Future<void> register() async {
    debugPrint('registrar');
    String name = nameCaptura.text;
    String email = emailCaptura.text.trim();
    String phone = '+57 ${phoneCaptura.text.trim()}';
    String password = passwordCaptura.text.trim();
    String passwordConfirm = passwordConfirmationCaptura.text.trim();
    String res = "Ha ocurrido un error, revisa los datos";
    debugPrint(
      'DATOS CAPTURADOS \n'
      '$name \n'
      '$email \n',
    );
    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty) {
      res = "Ingresa todos los datos";
    } else if (phone.length < 10) {
      res = "Numero de teléfono no valido";
    } else if (password != passwordConfirm) {
      res = "Las contraseñas no coinciden";
    } else if (!isTyCCheck) {
      res = "Acepta los términos y condiciones";
    } else {
      String registerStatus = await _authProvider!.register(email, password);
      if (registerStatus == "Usuario creado") {
        final UserModel userModel = UserModel(
          id: _authProvider!.getUser()!.uid,
          nombre: name,
          correo: email,
          telefono: phone,
          contrasena: password,
        );
        await _userProvider!.createUser(userModel);
        res = "Usuario creado";
      } else {
        res = registerStatus;
      }
    }
    debugPrint(res);
    if (res == "Usuario creado") {
      Navigator.pushNamed(context!, 'home');
      showSnackBar(res, context!);
      await _authProvider!.signOut();
    } else {
      showSnackBar(res, context!);
      debugPrint(res);
    }
  }
}
