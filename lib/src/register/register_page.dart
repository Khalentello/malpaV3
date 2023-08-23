import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _controller = RegisterController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pagina de registro',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Center(
            child: Column(
              children: [
                _txtData(),
                const SizedBox(height: 30),
                _divDataUser(),
                _btnRegisterUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _txtData() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: const Text(
        'Ingresa los siguientes datos',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _divDataUser() {
    return Column(
      children: [
        TextField(
          controller: _controller.nameUser,
          decoration: InputDecoration(
            hintText: 'Nombre de usuario',
            hintStyle: const TextStyle(color: Colors.black),
            labelText: 'Nombre de usuario',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: const Icon(
              Icons.email_rounded,
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.amber.withOpacity(0.3),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: _controller.phoneUser,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Celular',
            hintStyle: const TextStyle(color: Colors.black),
            labelText: 'Ingrese el numero celular',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: const Icon(
              Icons.phone_android_rounded,
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.amber.withOpacity(0.3),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: _controller.emailUser,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email@domain.com',
            hintStyle: const TextStyle(color: Colors.black),
            labelText: 'Ingrese tu correo electronico',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: const Icon(
              Icons.phone_android_rounded,
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.amber.withOpacity(0.3),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: _controller.passwordUser,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '*************',
            hintStyle: const TextStyle(color: Colors.black),
            labelText: 'Ingrese la contraseña',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: const Icon(
              Icons.lock_clock_rounded,
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.amber.withOpacity(0.3),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: _controller.repeatPasswordUser,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '*************',
            hintStyle: const TextStyle(color: Colors.black),
            labelText: 'Repita la contraseña',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: const Icon(
              Icons.lock_clock_rounded,
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.amber.withOpacity(0.3),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnRegisterUser() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber.shade700, Colors.amberAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 7,
            blurRadius: 9,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {
          _controller.registerUser();
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registrar ahora',
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
