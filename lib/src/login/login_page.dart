import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/login/login_controller.dart';

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
    return Scaffold(
      body: Form(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
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
              _divInputs(),
              _btnLogin(),
              _btnRegisterPage(),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET COMPONETS
  Widget _logo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
      child: Image.asset('assets/img/logoMalpa.png'),
    );
  }

  Widget _divInputs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: [
          TextField(
            controller: _controller.emailController,
            decoration: const InputDecoration(
              hintText: 'user@domain.com',
              hintStyle: TextStyle(color: Colors.black),
              labelText: 'Ingrese el correo electronico',
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              suffixIcon: Icon(
                Icons.email_rounded,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: _controller.passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '*********',
              hintStyle: TextStyle(color: Colors.black),
              labelText: 'Ingrese la contraseña',
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              suffixIcon: Icon(
                Icons.lock_clock_rounded,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white60, Colors.white38],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {
          _controller.login();
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Iniciar secion',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 30),
            Icon(Icons.login_rounded)
          ],
        ),
      ),
    );
  }

  Widget _btnRegisterPage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white60, Colors.white38],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {
          _controller.goToRegisterPage();
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registrar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 30),
            Icon(Icons.app_registration_rounded)
          ],
        ),
      ),
    );
  }
}
