import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'router.gr.dart';
import 'themes.dart';

SharedPreferences? _prefs;

Future main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences.getInstance().then((instance) {
    _prefs = instance;
    runApp(const MyApp());
  });
}

bool isLoggedIn() {
  bool loggedIn = false;
  if (_prefs != null) {
    String? loginToken = _prefs?.getString('LoginToken');

    if (loginToken != null) {
      loggedIn = true;
    }
  }
  return loggedIn;
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

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(initialRoutes: [
          isLoggedIn() ? const HomeRoute() : const SetupRoute()
        ]));
  }
}
