import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  String? sessionID;

  Future<String> getSessionID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('LoginToken') ?? '';
  }

  Future<bool> isLoggedIn() async {
    String sessionID = await getSessionID();

    if (sessionID != '') {
      return true;
    }
    return false;
  }

  void setSessionID(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LoginToken', token);
  }

  void destroySession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LoginToken');
    //Need to destroy the session on the server
  }

  void destroyAllSessions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LoginToken');
    //Need to destroy all sessions on the server
  }
}
