import 'package:auto_route/annotations.dart';

import 'screens/home.dart';
import 'screens/setup.dart';
import 'screens/login.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: SetupScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen)
  ],
)
class $AppRouter {}
