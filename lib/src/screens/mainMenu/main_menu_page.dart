import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/screens/mainMenu/main_menu_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});
  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  //importar controlador
  final MainMenuController _controller = MainMenuController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _controller.init(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 5,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Menu Principal',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        // actions: const [
        //   IconButton(
        //     onPressed: null,
        //     icon: Icon(Icons.logout),
        //   ),
        // ],
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
            children: [
              _btnReportPage(),
              _btnMyInfractions(),
              _btnCursoMovilidad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btnReportPage() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => {_controller.goReportPage()},
        icon: const Icon(
          Icons.report,
          size: 50,
        ),
        label: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Reportar Infracción",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _btnMyInfractions() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: null,
        icon: const Icon(
          Icons.pageview,
          size: 50,
        ),
        label: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Mis Infracciones",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _btnCursoMovilidad() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: null,
        icon: const Icon(
          Icons.class_,
          size: 50,
        ),
        label: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Curso movilidad",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
