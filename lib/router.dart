import 'package:auto_route/annotations.dart';
import 'package:chastilock/screens/loadlock.dart';
import 'package:chastilock/screens/loadlockcamera.dart';
import 'package:chastilock/screens/loadlockfromid.dart';
import 'package:chastilock/screens/settings.dart';
import 'package:chastilock/screens/home.dart';
import 'package:chastilock/screens/setup/login_anon.dart';
import 'package:chastilock/screens/setup/setup.dart';
import 'package:chastilock/screens/setup/login.dart';
import 'package:chastilock/screens/setup/forgotten_password.dart';
import 'package:chastilock/screens/setup/anon_account.dart';

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
    AutoRoute(page: LoadLockPage, path: '/loadlock'),
    AutoRoute(page: LoadLockCameraPage, path: '/loadlock/camera'),
    AutoRoute(page: LoadLockFromIDPage, path: '/loadlock/:lockId'),
    AutoRoute(page: CreateAnonPage, path: '/createanon'),
    AutoRoute(page: LoginAnonPage, path: '/loginanon')
  ],
)
class $AppRouter {}
