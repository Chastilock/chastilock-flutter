import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login.dart';
import 'router.gr.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //App State!!

  bool loggedIn = false;
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* return MaterialApp(
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
    ); */
    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
