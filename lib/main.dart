import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool loggedIn = true;
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    getLoggedIn();
  }

//NOT WORKING YET!
  Future<bool> getLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    if (token != null && token.isNotEmpty) {
      loggedIn = true;
    }
    return loggedIn;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*  return MaterialApp(
        title: 'Chastilock',
        theme:
            /* light theme settings */
            ThemeData(
                brightness: Brightness.light, primarySwatch: Colors.lightBlue),
        darkTheme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.lightBlue
            /* dark theme settings */
            ),
        themeMode: ThemeMode.system,
        home: MaterialApp.router(
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate())); */

    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(initialRoutes: [
          if (!loggedIn) SetupScreenRoute(),
          if (loggedIn) HomeScreenRoute()
        ]));
  }
}
