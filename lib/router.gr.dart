// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import 'screens/home.dart' as _i3;
import 'screens/loadlock.dart' as _i6;
import 'screens/loadlockcamera.dart' as _i7;
import 'screens/settings.dart' as _i5;
import 'screens/setup/forgottenpassword.dart' as _i4;
import 'screens/setup/login.dart' as _i2;
import 'screens/setup/setup.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SetupRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SetupPage());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    ForgottenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgottenPage());
    },
    SettingsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsPage());
    },
    LoadLockRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LoadLockPage());
    },
    LoadLockCameraRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoadLockCameraPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SetupRoute.name, path: '/'),
        _i8.RouteConfig(LoginRoute.name, path: '/login'),
        _i8.RouteConfig(HomeRoute.name, path: '/home'),
        _i8.RouteConfig(ForgottenRoute.name, path: '/forgot'),
        _i8.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i8.RouteConfig(LoadLockRoute.name, path: '/loadlock'),
        _i8.RouteConfig(LoadLockCameraRoute.name, path: '/loadlockcamera')
      ];
}

/// generated route for
/// [_i1.SetupPage]
class SetupRoute extends _i8.PageRouteInfo<void> {
  const SetupRoute() : super(SetupRoute.name, path: '/');

  static const String name = 'SetupRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ForgottenPage]
class ForgottenRoute extends _i8.PageRouteInfo<void> {
  const ForgottenRoute() : super(ForgottenRoute.name, path: '/forgot');

  static const String name = 'ForgottenRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i6.LoadLockPage]
class LoadLockRoute extends _i8.PageRouteInfo<void> {
  const LoadLockRoute() : super(LoadLockRoute.name, path: '/loadlock');

  static const String name = 'LoadLockRoute';
}

/// generated route for
/// [_i7.LoadLockCameraPage]
class LoadLockCameraRoute extends _i8.PageRouteInfo<void> {
  const LoadLockCameraRoute()
      : super(LoadLockCameraRoute.name, path: '/loadlockcamera');

  static const String name = 'LoadLockCameraRoute';
}
