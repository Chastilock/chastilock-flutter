// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import 'screens/home.dart' as _i3;
import 'screens/loadlock.dart' as _i6;
import 'screens/loadlockcamera.dart' as _i7;
import 'screens/loadlockfromid.dart' as _i8;
import 'screens/settings.dart' as _i5;
import 'screens/setup/anon_account.dart' as _i9;
import 'screens/setup/forgotten_password.dart' as _i4;
import 'screens/setup/login.dart' as _i2;
import 'screens/setup/login_anon.dart' as _i10;
import 'screens/setup/setup.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SetupRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SetupPage());
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    ForgottenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgottenPage());
    },
    SettingsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsPage());
    },
    LoadLockRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LoadLockPage());
    },
    LoadLockCameraRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoadLockCameraPage());
    },
    LoadLockFromIDRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<LoadLockFromIDRouteArgs>(
          orElse: () =>
              LoadLockFromIDRouteArgs(lockId: queryParams.optString('lockId')));
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.LoadLockFromIDPage(key: args.key, lockId: args.lockId));
    },
    CreateAnonRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CreateAnonPage());
    },
    LoginAnonRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.LoginAnonPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SetupRoute.name, path: '/'),
        _i11.RouteConfig(LoginRoute.name, path: '/login'),
        _i11.RouteConfig(HomeRoute.name, path: '/home'),
        _i11.RouteConfig(ForgottenRoute.name, path: '/forgot'),
        _i11.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i11.RouteConfig(LoadLockRoute.name, path: '/loadlock'),
        _i11.RouteConfig(LoadLockCameraRoute.name, path: '/loadlock/camera'),
        _i11.RouteConfig(LoadLockFromIDRoute.name, path: '/loadlock/:lockId'),
        _i11.RouteConfig(CreateAnonRoute.name, path: '/createanon'),
        _i11.RouteConfig(LoginAnonRoute.name, path: '/loginanon')
      ];
}

/// generated route for
/// [_i1.SetupPage]
class SetupRoute extends _i11.PageRouteInfo<void> {
  const SetupRoute() : super(SetupRoute.name, path: '/');

  static const String name = 'SetupRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ForgottenPage]
class ForgottenRoute extends _i11.PageRouteInfo<void> {
  const ForgottenRoute() : super(ForgottenRoute.name, path: '/forgot');

  static const String name = 'ForgottenRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i6.LoadLockPage]
class LoadLockRoute extends _i11.PageRouteInfo<void> {
  const LoadLockRoute() : super(LoadLockRoute.name, path: '/loadlock');

  static const String name = 'LoadLockRoute';
}

/// generated route for
/// [_i7.LoadLockCameraPage]
class LoadLockCameraRoute extends _i11.PageRouteInfo<void> {
  const LoadLockCameraRoute()
      : super(LoadLockCameraRoute.name, path: '/loadlock/camera');

  static const String name = 'LoadLockCameraRoute';
}

/// generated route for
/// [_i8.LoadLockFromIDPage]
class LoadLockFromIDRoute extends _i11.PageRouteInfo<LoadLockFromIDRouteArgs> {
  LoadLockFromIDRoute({_i12.Key? key, required String? lockId})
      : super(LoadLockFromIDRoute.name,
            path: '/loadlock/:lockId',
            args: LoadLockFromIDRouteArgs(key: key, lockId: lockId),
            rawQueryParams: {'lockId': lockId});

  static const String name = 'LoadLockFromIDRoute';
}

class LoadLockFromIDRouteArgs {
  const LoadLockFromIDRouteArgs({this.key, required this.lockId});

  final _i12.Key? key;

  final String? lockId;

  @override
  String toString() {
    return 'LoadLockFromIDRouteArgs{key: $key, lockId: $lockId}';
  }
}

/// generated route for
/// [_i9.CreateAnonPage]
class CreateAnonRoute extends _i11.PageRouteInfo<void> {
  const CreateAnonRoute() : super(CreateAnonRoute.name, path: '/createanon');

  static const String name = 'CreateAnonRoute';
}

/// generated route for
/// [_i10.LoginAnonPage]
class LoginAnonRoute extends _i11.PageRouteInfo<void> {
  const LoginAnonRoute() : super(LoginAnonRoute.name, path: '/loginanon');

  static const String name = 'LoginAnonRoute';
}
