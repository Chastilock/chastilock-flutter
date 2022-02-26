import 'package:auto_route/annotations.dart';
import 'package:chastilock/screens/setup/forgottenpassword.dart';

import 'screens/home.dart';
import 'screens/setup/setup.dart';
import 'screens/setup/login.dart';
import 'screens/setup/forgottenpassword.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: SetupScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ForgottenScreen)
  ],
)
class $AppRouter {}
