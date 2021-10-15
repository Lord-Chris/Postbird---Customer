abstract class IStorageService {
  Future<void> saveString(String key, String val);
  Future<void> saveInt(String key, int val);
  Future<void> saveBool(String key, bool val);
  Future<void> saveStringList(String key, List<String> val);
  Future<void> saveMap(String key, Map<String, dynamic> val);
  String? getString(String key);
  bool? getBool(String key);
  int? getInt(String key);
  List<String>? getStringList(String key);
  Map<String, dynamic>? getMap(String key);
}
