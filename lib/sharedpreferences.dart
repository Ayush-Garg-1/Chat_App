import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static setImagePath(String profile_path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("profilePath", profile_path);
  }

  static setUserLoginIn(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", isLogin);
  }

  static setUserInfo(String key, var data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static setUserAge(int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("user_age", age);
  }

  static getUserInfo(var key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key) ?? "No Available";
  }

  static userLogout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("isLogin");
  }
}
