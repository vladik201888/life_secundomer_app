import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyBirthday = 'birthday';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);

  static String? getUsername() => _preferences.getString(_keyUsername);

  static Future setBirthday(DateTime dateofBirth) async {
    final date = dateofBirth.toIso8601String();
    return await _preferences.setString(_keyBirthday, date);
  }

  static bool checkBirthday() {
    // get from pref

    // print('Hello CheckBirthday');
    final date = _preferences.getString(_keyBirthday);
    // print(date);

    return date != null ? true : false;
  }

  static DateTime getBirthday() {
    // get from pref
    // print('Get CheckBirthday');
    final date = _preferences.getString(_keyBirthday)!;
    // print(date);
    //return data
    return DateTime.tryParse(date)!;
  }
}
