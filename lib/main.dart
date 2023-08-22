import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malpav3/firebase_options.dart';
import 'package:malpav3/src/home/home_page.dart';
import 'package:malpav3/src/mainMenu/main_menu_page.dart';
import 'package:malpav3/src/register/register_page.dart';

import 'src/tyc/tyc_page.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // ARRANQUE FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Malpa());
}

class Malpa extends StatefulWidget {
  const Malpa({super.key});

  @override
  State<Malpa> createState() => _MalpaState();
}

class _MalpaState extends State<Malpa> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      debugShowCheckedModeBanner: false,
      title: 'malpa',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomePage(),
        'register': (BuildContext context) => const RegisterPage(),
        'tyc': (BuildContext context) => const TyCPage(),
        'mainMenu': (BuildContext context) => const MainMenuPage(),
      },
    );
  }
}
