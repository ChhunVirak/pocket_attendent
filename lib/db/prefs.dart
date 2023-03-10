import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class PrefsDBService {
  static Future<bool> isFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? userData = prefs.getStringList('CRData');
    return userData == null;
  }

  static Future<void> saveCRData({
    required String name,
    required String batchCode,
    required String deptCode,
    required String section,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('CRData', [name, batchCode, deptCode, section]);
  }

  static Future<List<String>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cRData = prefs.getStringList('CRData');
    return cRData;
  }
}
