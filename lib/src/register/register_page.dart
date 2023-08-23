import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/register/register_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';
import 'package:malpav3/widgets/text_input_field.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Regístrate',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Form(
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _txtData(),
                  _nameInput(),
                  _phoneInput(),
                  _password1Input(),
                  _password2Input(),
                  // _divDataUser(),
                  _checkTermsConditions(),
                  _btnRegisterUser(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _txtData() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: const Text(
        'Ingresa los siguientes datos',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _nameInput() {
    return TextInputField(
      textEditingController: _controller.nameUser,
      hintText: "Nombre de usuario",
      icon: 3,
      textInputType: TextInputType.name,
      marginBottom: 37,
      marginTop: 0,
    );
  }

  Widget _phoneInput() {
    return TextInputField(
      textEditingController: _controller.phoneUser,
      hintText: "Numero de celular",
      icon: 1,
      textInputType: TextInputType.phone,
      marginBottom: 37,
      marginTop: 0,
    );
  }

  Widget _password1Input() {
    return TextInputField(
      textEditingController: _controller.passwordUser,
      hintText: "Ingresa tu contraseña",
      icon: 2,
      textInputType: TextInputType.visiblePassword,
      marginBottom: 37,
      isPass: true,
      marginTop: 0,
    );
  }

  Widget _password2Input() {
    return TextInputField(
      textEditingController: _controller.repeatPasswordUser,
      hintText: "Repite tu contraseña",
      icon: 2,
      textInputType: TextInputType.visiblePassword,
      marginBottom: 37,
      isPass: true,
      marginTop: 0,
    );
  }

  // Widget _divDataUser() {
  //   return Column(
  //     children: [
  //       TextField(
  //         controller: _controller.nameUser,
  //         decoration: InputDecoration(
  //           hintText: 'Nombre de usuario',
  //           hintStyle: const TextStyle(color: Colors.black),
  //           labelText: 'Nombre de usuario',
  //           labelStyle: const TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //           suffixIcon: const Icon(
  //             Icons.email_rounded,
  //             color: Colors.black,
  //           ),
  //           filled: true,
  //           fillColor: Colors.amber.withOpacity(0.3),
  //           border: const OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 40),
  //       TextField(
  //         controller: _controller.phoneUser,
  //         keyboardType: TextInputType.phone,
  //         decoration: InputDecoration(
  //           hintText: 'Celular',
  //           hintStyle: const TextStyle(color: Colors.black),
  //           labelText: 'Ingrese el numero celular',
  //           labelStyle: const TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //           suffixIcon: const Icon(
  //             Icons.phone_android_rounded,
  //             color: Colors.black,
  //           ),
  //           filled: true,
  //           fillColor: Colors.amber.withOpacity(0.3),
  //           border: const OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 40),
  //       TextField(
  //         controller: _controller.emailUser,
  //         keyboardType: TextInputType.emailAddress,
  //         decoration: InputDecoration(
  //           hintText: 'email@domain.com',
  //           hintStyle: const TextStyle(color: Colors.black),
  //           labelText: 'Ingrese tu correo electronico',
  //           labelStyle: const TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //           suffixIcon: const Icon(
  //             Icons.phone_android_rounded,
  //             color: Colors.black,
  //           ),
  //           filled: true,
  //           fillColor: Colors.amber.withOpacity(0.3),
  //           border: const OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 40),
  //       TextField(
  //         controller: _controller.passwordUser,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           hintText: '*************',
  //           hintStyle: const TextStyle(color: Colors.black),
  //           labelText: 'Ingrese la contraseña',
  //           labelStyle: const TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //           suffixIcon: const Icon(
  //             Icons.lock_clock_rounded,
  //             color: Colors.black,
  //           ),
  //           filled: true,
  //           fillColor: Colors.amber.withOpacity(0.3),
  //           border: const OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 40),
  //       TextField(
  //         controller: _controller.repeatPasswordUser,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           hintText: '*************',
  //           hintStyle: const TextStyle(color: Colors.black),
  //           labelText: 'Repita la contraseña',
  //           labelStyle: const TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //           suffixIcon: const Icon(
  //             Icons.lock_clock_rounded,
  //             color: Colors.black,
  //           ),
  //           filled: true,
  //           fillColor: Colors.amber.withOpacity(0.3),
  //           border: const OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget _checkTermsConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _controller.isTyCCheck,
          onChanged: (value) {
            setState(() {
              _controller.isTyCCheck = value!;
            });
          },
          checkColor: Colors.white,
          activeColor: buttonColor,
          hoverColor: Colors.amber,
        ),
        const Text(
          "Aceptas los ",
          style: TextStyle(
            color: blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () => {
            _controller.showTyC(),
          },
          child: const Text(
            "términos y condiciones",
            style: TextStyle(
                color: blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget _btnRegisterUser() {
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
          _controller.registerUser();
        },
        child: const Center(
          child: Text(
            'Registrar',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );

    //   return Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
    //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [Colors.amber.shade700, Colors.amberAccent],
    //       ),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withOpacity(0.5),
    //           spreadRadius: 7,
    //           blurRadius: 9,
    //           offset: const Offset(0, 3), // changes position of shadow
    //         ),
    //       ],
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: GestureDetector(
    //       onTap: () {
    //         _controller.registerUser();
    //       },
    //       child: const Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             'Registrar ahora',
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 20,
    //             ),
    //           ),
    //           SizedBox(width: 30),
    //           Icon(Icons.app_registration_rounded)
    //         ],
    //       ),
    //     ),
    //   );
  }
}
