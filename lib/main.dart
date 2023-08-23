import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malpav3/firebase_options.dart';
import 'package:malpav3/src/login/login_page.dart';
import 'package:malpav3/src/register/register_page.dart';
import 'package:malpav3/src/report_event/report_event_page.dart';

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
      initialRoute: 'report/event',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
        'report/event': (BuildContext context) => const ReportEventPage(),
      },
    );
  }
}
