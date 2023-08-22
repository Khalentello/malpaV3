// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/home/home_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';
import 'package:malpav3/widgets/static_field.dart';
import 'package:malpav3/widgets/text_input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // CALL CONTROLLER

  final HomeController _controller = HomeController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  //// WIDGET PADRE
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryColor, secondaryColor]),
            ),
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _logo(),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _staticTextIngresa(),
                      _inputEmail(),
                      _staticTextOTambien(),
                      _password(),
                      _btnLogin(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _staticTextSinCuenta(),
                      _btnRegister(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //// WIDGETS HIJOS
  // Widget Logo
  Widget _logo() {
    return Image.asset(
      'assets/img/logoMalpa.png',
      width: 300,
    );
  }

  ///Widget Texto Ingresa
  Widget _staticTextIngresa() {
    return (const StaticTextField(staticText: "Ingresa", fontSize: 23));
  }

  //Widget Ingresar correo
  Widget _inputEmail() {
    return TextInputField(
      textEditingController: _controller.emailCapture,
      hintText: "Ingresa Tu Correo",
      isPass: false,
      icon: 0,
      textInputType: TextInputType.emailAddress,
    );
  }

  ///Widget Texto o tambien
  Widget _staticTextOTambien() {
    return (const StaticTextField(staticText: "O También", fontSize: 18));
  }

  //Widget Ingresar clave
  Widget _password() {
    return TextInputField(
      textEditingController: _controller.passwordCaptura,
      hintText: "Contraseña",
      icon: 2,
      textInputType: TextInputType.visiblePassword,
      isPass: true,
    );
  }

  ///Widget Texto o tambien
  Widget _staticTextSinCuenta() {
    return (const StaticTextField(
        staticText: "¿No tienes cuenta?", fontSize: 20));
  }

  // Widget btn ingresar
  Widget _btnLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () =>
        {_controller.login(), FocusScope.of(context).unfocus()},
        icon: const Icon(
          Icons.login,
          color: Colors.black,
        ),
        label: const Text(
          'Iniciar sesión',
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shadowColor: const Color.fromRGBO(255, 224, 23, 1),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  // Widget label regístrate
  Widget _btnRegister() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => {
          Navigator.pushNamed(context, 'register'),
          FocusScope.of(context).unfocus(),
        },
        icon: const Icon(
          Icons.article_rounded,
          color: Colors.black,
        ),
        label: const Text(
          'Regístrate',
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shadowColor: const Color.fromRGBO(255, 224, 23, 1),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
