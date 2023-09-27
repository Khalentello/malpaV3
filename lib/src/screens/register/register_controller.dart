import 'package:flutter/material.dart';
import 'package:malpav3/src/models/user.dart';
import 'package:malpav3/src/providers/auth_provider.dart';
import 'package:malpav3/src/providers/user_provider.dart';

class RegisterController {
  BuildContext? context;
  final TextEditingController nameUser = TextEditingController();
  final TextEditingController lastNameUser = TextEditingController();
  final TextEditingController phoneUser = TextEditingController();
  final TextEditingController emailUser = TextEditingController();
  final TextEditingController passwordUser = TextEditingController();
  final TextEditingController repeatPasswordUser = TextEditingController();
  AuthProvider? _authProvider;
  UserProvider? _userProvider;
  String countryUser = "País";
  bool isTyCCheck = false;
  bool passwordLength = false;
  bool passwordWithCapitalLetter = false;
  bool passwordWithLetter = false;
  bool passwordWithNumber = false;

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
    String lastName = lastNameUser.text;
    String country = countryUser;
    String phone = phoneUser.text.trim();
    String email = emailUser.text.trim();
    String password = passwordUser.text.trim();
    String passwordConfirm = repeatPasswordUser.text.trim();
    debugPrint('##$country');
    passwordLength = password.length <= 20 && password.length >= 8;
    passwordWithCapitalLetter = RegExp(r'(?=.*?[A-Z])').hasMatch(password);
    passwordWithLetter = RegExp(r'(?=.*?[a-z])').hasMatch(password);
    passwordWithNumber = RegExp(r'(?=.*?[0-9]+)').hasMatch(password);
    debugPrint('###Length${passwordLength}');
    debugPrint('###Capital${passwordWithCapitalLetter}');
    debugPrint('###Letter${passwordWithLetter}');
    debugPrint('###Number${passwordWithNumber}');
    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordConfirm.isEmpty ||
        country == 'País') {
      debugPrint('### NINGUNA CASILLA DEBE IR VACÍA ####');
    } else if (password != passwordConfirm) {
      debugPrint('### LAS CONTRASEÑAS DEBEN IR IGUALES ####');
    }
    // else if (!passwordLength) {
    //   debugPrint(
    //       '### LAS CONTRASEÑAS DEBEN SER MAYORES A 8 Y MENOR A 20 CARACTERES ####');
    // }
    // else if (!passwordWithCapitalLetter &&
    //     !passwordWithLetter &&
    //     !passwordWithNumber) {
    //   debugPrint('### LA CONTRASEÑA NO CUMPLE CON LOS PARÁMETROS ####');
    // }
    else if (!isTyCCheck) {
      debugPrint('### ACEPTA TÉRMINOS Y CONDICIONES ####');
    } else {
      try {
        bool isRegister = await _authProvider!.register(email, password);
        if (isRegister) {
          final UserApp user = UserApp(
            id: _authProvider!.getUser()!.uid,
            name: name,
            lastName: lastName,
            country: country,
            phone: phone,
            email: email,
            password: password, //quitar linea cuando se finalice
          );
          debugPrint('##$user.toString()');
          await _userProvider!.createUser(user);
          Navigator.pushNamed(context!, 'report/event');
        }
      } catch (e) {
        debugPrint('### ERROR REGISTER USER REGISTER CONTROLLER $e ####');
      }
    }
  }
}
