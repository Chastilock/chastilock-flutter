import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chastilock/firebase_options.dart';
import 'package:chastilock/router.gr.dart';
import 'package:chastilock/themes.dart';
import 'package:chastilock/api/client.dart';

late SharedPreferences _prefs;

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

  bool isLoggedIn() {
    if (_prefs.getString('LoginToken') != null) {
      return true;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp.router(
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(initialRoutes: [
          isLoggedIn() ? const HomeRoute() : const SetupRoute()
        ]))
    );
    
    
  }
}
