import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/register/register_controller.dart';
import 'package:malpav3/widgets/static_field.dart';
import 'package:malpav3/widgets/text_input_field.dart';
import '../utils/colors_generic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // CALL REGISTER CONTROLLER
  final RegisterController _controller = RegisterController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  // WIDGET PADRE
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Registro',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor,
                  secondaryColor,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _staticTextIngresaDatos(),
                _registerName(),
                _registerEmail(),
                _registerPhone(),
                _registerPassword1(),
                _registerPassword2(),
                _checkTermsConditions(),
                _btnRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget btn registrar
  Widget _staticTextIngresaDatos() {
    return const StaticTextField(
        staticText: "Ingresa los siguientes datos:", fontSize: 20);
  }

  Widget _registerName() {
    return TextInputField(
        textEditingController: _controller.nameCaptura,
        hintText: "Ingresa tu nombre",
        icon: 3,
        textInputType: TextInputType.name);
  }

  Widget _registerEmail() {
    return TextInputField(
        textEditingController: _controller.emailCaptura,
        hintText: "Ingresa tu email",
        icon: 0,
        textInputType: TextInputType.emailAddress);
  }

  Widget _registerPhone() {
    return TextInputField(
      textEditingController: _controller.phoneCaptura,
      hintText: "Ingresa tu numero de celular",
      icon: 1,
      textInputType: TextInputType.phone,
      textInputLength: 10,
    );
  }

  Widget _registerPassword1() {
    return TextInputField(
      textEditingController: _controller.passwordCaptura,
      hintText: "Ingresa tu contraseña",
      icon: 2,
      textInputType: TextInputType.visiblePassword,
      isPass: true,
    );
  }

  Widget _registerPassword2() {
    return TextInputField(
      textEditingController: _controller.passwordConfirmationCaptura,
      hintText: "Repite tu contraseña",
      icon: 2,
      textInputType: TextInputType.visiblePassword,
      isPass: true,
    );
  }

  Widget _checkTermsConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _controller.isTyCCheck,
          onChanged: (value) {
            setState(() {
              _controller.isTyCCheck = value!;
              debugPrint(_controller.isTyCCheck.toString());
            });
          },
          checkColor: Colors.white,
          activeColor: Colors.green,
          hoverColor: Colors.amber,
        ),
        const Text(
          "Aceptas los ",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: () => {
            _controller.showTyC(),
          },
          child: const Text(
            "términos y condiciones",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget _btnRegister() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _controller.isTyCCheck
            ? () => {_controller.register(), FocusScope.of(context).unfocus()}
            : null,
        label: const Text(
          'Registrar Ahora',
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.app_registration,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shadowColor: const Color.fromRGBO(255, 224, 23, 1),
          elevation: 20,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
