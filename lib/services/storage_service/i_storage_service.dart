abstract class IStorageService {
  Future<void> init();
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
  Future<void> clearData(String key);
  Future<void> clearAll();

  // Secured Storage
  Future<void> secureSave(String key, String val);
  Future<String?> secureGet(String key);
  Future<void> clearSecuredData(String key);
  Future<void> clearAllSecured();
}
