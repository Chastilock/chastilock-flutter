import 'package:auto_route/annotations.dart';
import 'package:chastilock/screens/loadlock.dart';
import 'package:chastilock/screens/loadlockcamera.dart';
import 'package:chastilock/screens/loadlockfromid.dart';
import 'package:chastilock/screens/settings.dart';

import 'screens/home.dart';
import 'screens/setup/setup.dart';
import 'screens/setup/login.dart';
import 'screens/setup/forgottenpassword.dart';

//TODO: Deeplinking to paramenter route not working.
//TODO: implement Apple deep linking
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SetupPage, initial: true),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: HomePage, path: '/home'),
    AutoRoute(page: ForgottenPage, path: '/forgot'),
    AutoRoute(page: SettingsPage, path: '/settings'),
    AutoRoute(page: LoadLockPage, path: '/load'),
    AutoRoute(page: LoadLockCameraPage, path: '/cameraloadlock'),
    AutoRoute(page: LoadLockFromIDPage, path: '/loadlock/:lockId')
  ],
)
class $AppRouter {}
