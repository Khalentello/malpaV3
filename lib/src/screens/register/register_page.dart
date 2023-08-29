import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/screens/register/register_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';
import 'package:malpav3/widgets/static_text_register.dart';
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
        body: SingleChildScrollView(
          child: Container(
            color: primaryColor,
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 66,
              bottom: 12,
            ),
            child: Column(
              children: [
                _firstNameInput(),
                _lastNameInput(),
                _phoneInput(),
                _emailInput(),
                _password1Input(),
                _password2Input(),
                _checkTermsConditions(),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 17, right: 17, top: 34),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: _btnGoBack()),
                      Expanded(flex: 1, child: _btnRegisterUser()),
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

  Widget _firstNameInput() {
    return Column(
      children: [
        StaticTextRegister(
          staticText: "Nombre(s)",
        ),
        TextInputField(
          textEditingController: _controller.nameUser,
          hintText: "Ingresa tu nombre",
          icon: 3,
          textInputType: TextInputType.name,
          marginBottom: 16,
          marginTop: 5,
        ),
      ],
    );
  }

  Widget _lastNameInput() {
    return Column(
      children: [
        StaticTextRegister(
          staticText: "Apellidos",
        ),
        TextInputField(
          textEditingController: _controller.nameUser,
          hintText: "Ingresa tus apellidos",
          icon: 3,
          textInputType: TextInputType.name,
          marginBottom: 16,
          marginTop: 5,
        ),
      ],
    );
  }

  Widget _phoneInput() {
    return Column(
      children: [
        StaticTextRegister(
          staticText: "Numero de celular",
        ),
        TextInputField(
          textEditingController: _controller.phoneUser,
          hintText: "Numero de celular",
          icon: 1,
          textInputType: TextInputType.phone,
          marginBottom: 16,
          marginTop: 5,
        ),
      ],
    );
  }

  Widget _emailInput() {
    return Column(
      children: [
        StaticTextRegister(
          staticText: "Dirección de correo electrónico",
        ),
        TextInputField(
          textEditingController: _controller.emailUser,
          hintText: "Ingrese su correo electrónico",
          icon: 1,
          textInputType: TextInputType.phone,
          marginBottom: 16,
          marginTop: 5,
        ),
      ],
    );
  }

  Widget _password1Input() {
    return Column(
      children: [
        StaticTextRegister(
          staticText: 'Contraseña',
        ),
        TextInputField(
          textEditingController: _controller.passwordUser,
          hintText: "Ingresa tu contraseña",
          icon: 2,
          textInputType: TextInputType.visiblePassword,
          marginBottom: 16,
          isPass: true,
          marginTop: 5,
        ),
      ],
    );
  }

  Widget _password2Input() {
    return Column(
      children: [
        StaticTextRegister(
          staticText: "Repetir contraseña",
        ),
        TextInputField(
          textEditingController: _controller.repeatPasswordUser,
          hintText: "Repite tu contraseña",
          icon: 2,
          textInputType: TextInputType.visiblePassword,
          marginBottom: 16,
          isPass: true,
          marginTop: 5,
        ),
      ],
    );
  }

  Widget _checkTermsConditions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 66),
      child: Row(
        children: [
          Checkbox(
            value: _controller.isTyCCheck,
            onChanged: (value) {
              setState(() {
                _controller.isTyCCheck = value!;
              });
            },
            checkColor: whiteColor,
            activeColor: buttonColor,
          ),
          Flexible(
            child: InkWell(
              onTap: () => {
                _controller.showTyC(),
              },
              child: const Text(
                "Acepto Los Términos Y Condiciones Sujetos A Malpa",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnRegisterUser() {
    return Container(
      height: 38,
      margin: EdgeInsets.only(left: 22),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: () => _controller.registerUser(),
        child: const Center(
          child: Text(
            'Registrar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _btnGoBack() {
    return Container(
      height: 38,
      margin: EdgeInsets.only(right: 22),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            side: BorderSide(color: buttonColor)),
        onPressed: () => _controller.goLogin(),
        child: const Center(
          child: Text(
            'Atrás',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
