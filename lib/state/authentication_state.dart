import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationState with ChangeNotifier {
  final SharedPreferences prefs;
  String token = '';

  AuthenticationState({required this.prefs});

  void _setPrefItems() {
    prefs.setString('LoginToken', token);
  }

  void _getPrefItems() {
    token = prefs.getString('LoginToken') ?? '';
  }

  void setToken(String newToken) {
    token = newToken;
    _setPrefItems();
    notifyListeners();
  }

  String getToken() {
    _getPrefItems();
    return token;
  }
}
