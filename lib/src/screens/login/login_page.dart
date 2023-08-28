import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/screens/login/login_controller.dart';
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
            decoration: BoxDecoration(color: primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: _logo(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        _emailInput(),
                        _passwordInput(),
                        _forgotPassword(),
                        _controller.loginError
                            ? _containerErrorMsg()
                            : SizedBox.shrink(),
                        _btnLogin(),
                        _containerRegisterPage()
                      ],
                    ),
                  ),
                ),
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
      margin: const EdgeInsets.only(top: 122, bottom: 84),
      child: Image.asset('assets/img/LogoMalpaV2.jpg'),
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
      withIcon: true,
    );
  }

  Widget _passwordInput() {
    return TextInputField(
      textEditingController: _controller.passwordController,
      hintText: 'Contraseña',
      icon: 2,
      textInputType: TextInputType.emailAddress,
      isPass: true,
      marginBottom: 0,
      marginTop: 0,
      withIcon: true,
    );
  }

  Widget _forgotPassword() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        child: Text(
          "Olvidé mi contraseña",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _containerErrorMsg() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text:
              "Datos incorrectos por favor verifique su correo y/o contraseña. Si olvidó su contraseña ",
          style: TextStyle(
            color: alertColor,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
          children: [
            TextSpan(
              text: "toca aca",
              style: TextStyle(
                color: buttonColor,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _controller.goResetPassword(),
            )
          ],
        ),
      ),
    );
  }

  Widget _btnLogin() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: () => setState(() {
          _controller.login();
        }),
        child: Text(
          'Iniciar sesión',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _containerRegisterPage() {
    return Container(
      margin: const EdgeInsets.only(
        top: 35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Aun no te has registrado? ",
            style: TextStyle(color: whiteColor),
          ),
          InkWell(
            onTap: () => {
              _controller.goToRegisterPage(),
            },
            child: const Text(
              "Regístrate aquí.",
              style: TextStyle(
                color: whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
