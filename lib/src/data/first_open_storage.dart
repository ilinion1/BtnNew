import 'package:shared_preferences/shared_preferences.dart';

class FirstOpenStorage {
  static Future<bool?> getFirst() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final first = sharedPreferences.getBool('first');
    return first;
  }

  static Future<void> setFirst(bool first) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('first', first);
  }
}
