// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'screens/home.dart' as _i3;
import 'screens/setup/forgottenpassword.dart' as _i4;
import 'screens/setup/login.dart' as _i2;
import 'screens/setup/setup.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SetupScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SetupScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    ForgottenScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgottenScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SetupScreenRoute.name, path: '/'),
        _i5.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i5.RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        _i5.RouteConfig(ForgottenScreenRoute.name, path: '/forgotten-screen')
      ];
}

/// generated route for
/// [_i1.SetupScreen]
class SetupScreenRoute extends _i5.PageRouteInfo<void> {
  const SetupScreenRoute() : super(SetupScreenRoute.name, path: '/');

  static const String name = 'SetupScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i5.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(LoginScreenRoute.name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.ForgottenScreen]
class ForgottenScreenRoute extends _i5.PageRouteInfo<void> {
  const ForgottenScreenRoute()
      : super(ForgottenScreenRoute.name, path: '/forgotten-screen');

  static const String name = 'ForgottenScreenRoute';
}
