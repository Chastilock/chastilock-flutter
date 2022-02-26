import 'package:shared_preferences/shared_preferences.dart';

class AccountHelpers {
  static Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    //Send Logout API request here
    bool done = await prefs.remove("LoginToken");
    return done;
  }
}
