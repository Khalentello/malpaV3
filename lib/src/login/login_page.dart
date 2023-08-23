import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/login/login_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';
import 'package:malpav3/widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();
  @override
  void initState() {
    // TODO: implement initState
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
        body: Form(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.amber.shade700, Colors.amber.shade200],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logo(),
                _emailInput(),
                _passwordInput(),
                // _divInputs(),
                _btnLogin(),
                _btnRegisterPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // WIDGET COMPONENTS
  Widget _logo() {
    return Container(
      margin: const EdgeInsets.only(top: 122, left: 46, right: 46, bottom: 84),
      child: Image.asset('assets/img/logoMalpa.png'),
    );
  }

  Widget _emailInput() {
    return TextInputField(
      textEditingController: _controller.emailController,
      hintText: 'Correo electrónico',
      icon: 0,
      textInputType: TextInputType.emailAddress,
      marginBottom: 10,
      marginTop: 0,
    );
  }

  Widget _passwordInput() {
    return TextInputField(
      textEditingController: _controller.passwordController,
      hintText: 'Contraseña',
      icon: 2,
      textInputType: TextInputType.emailAddress,
      isPass: true,
      marginBottom: 10,
      marginTop: 0,
    );
  }

  // Widget _divInputs() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
  //     child: Column(
  //       children: [
  //         TextField(
  //           controller: _controller.emailController,
  //           decoration: const InputDecoration(
  //             hintText: 'user@domain.com',
  //             hintStyle: TextStyle(color: Colors.black),
  //             labelText: 'Ingrese el correo electrónico',
  //             labelStyle: TextStyle(
  //               color: Colors.black,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             suffixIcon: Icon(
  //               Icons.email_rounded,
  //               color: Colors.black,
  //             ),
  //             filled: true,
  //             fillColor: Colors.white,
  //             border: OutlineInputBorder(
  //               borderSide: BorderSide.none,
  //               borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 40),
  //         TextField(
  //           controller: _controller.passwordController,
  //           obscureText: true,
  //           decoration: const InputDecoration(
  //             hintText: '*********',
  //             hintStyle: TextStyle(color: Colors.black),
  //             labelText: 'Ingrese la contraseña',
  //             labelStyle: TextStyle(
  //               color: Colors.black,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             suffixIcon: Icon(
  //               Icons.lock_clock_rounded,
  //               color: Colors.black,
  //             ),
  //             filled: true,
  //             fillColor: Colors.white,
  //             border: OutlineInputBorder(
  //               borderSide: BorderSide.none,
  //               borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _btnLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 47),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GestureDetector(
        onTap: () {
          _controller.login();
        },
        child: const Center(
          child: Text(
            'Iniciar sesión',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _btnRegisterPage() {
    return Container(
      margin: const EdgeInsets.only(
        top: 35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Aun no te has registrado? ",
            style: TextStyle(color: blackColor),
          ),
          InkWell(
            onTap: () => {
              _controller.goToRegisterPage(),
            },
            child: const Text(
              "Regístrate aquí.",
              style: TextStyle(
                color: blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
    // return row(
    //   margin: const EdgeInsets.only(top: 47),
    //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    //   width: double.infinity,
    //   height: 50,
    //   decoration: BoxDecoration(
    //     color: buttonColor,
    //     borderRadius: BorderRadius.circular(5),
    //   ),
    //   child: GestureDetector(
    //     onTap: () {
    //       _controller.goToRegisterPage();
    //     },
    //     child: const Center(
    //       child: Text(
    //         'Regístrate aquí',
    //         style: TextStyle(
    //             fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
    //       ),
    //     ),
    //   ),
    // );
  }
}
