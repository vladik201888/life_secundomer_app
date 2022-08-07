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

  static DateTime? getBirthday() {
    final date = _preferences.getString(_keyBirthday);

    return date == null ? null : DateTime.tryParse(date);
  }
}
