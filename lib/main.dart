import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chastilock',
      theme:
          /* light theme settings */
          ThemeData(
              brightness: Brightness.light, primarySwatch: Colors.lightBlue),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.lightBlue
              /* dark theme settings */
              ),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}
