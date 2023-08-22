import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malpav3/src/mainMenu/main_menu_controller.dart';
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
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Menu Principal',
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
            children: [
              _btnReportPage(),
              ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text("Reportar Infraccion"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btnReportPage() {
    return ElevatedButton.icon(
      onPressed: () => {_controller.goReportPage()},
      icon: const Icon(Icons.add_circle_outline_rounded),
      label: const Text("Reportar Infracción"),
    );
  }
}
