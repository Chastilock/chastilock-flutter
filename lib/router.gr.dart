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
    SetupRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SetupPage());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    ForgottenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgottenPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SetupRoute.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(HomeRoute.name, path: '/home'),
        _i5.RouteConfig(ForgottenRoute.name, path: '/forgot')
      ];
}

/// generated route for
/// [_i1.SetupPage]
class SetupRoute extends _i5.PageRouteInfo<void> {
  const SetupRoute() : super(SetupRoute.name, path: '/');

  static const String name = 'SetupRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ForgottenPage]
class ForgottenRoute extends _i5.PageRouteInfo<void> {
  const ForgottenRoute() : super(ForgottenRoute.name, path: '/forgot');

  static const String name = 'ForgottenRoute';
}
