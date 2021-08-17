import 'package:shared_preferences/shared_preferences.dart';

abstract class ICacheHandler {
  Future<bool> setData(String key, String data);
  Future<String?> getData(String key);
}

class CacheHandler implements ICacheHandler {
  @override
  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<bool> setData(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, data);
  }
}
