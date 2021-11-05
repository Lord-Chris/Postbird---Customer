import 'package:postbird/core/index.dart';

import 'i_storage_service.dart';

class StorageService extends IStorageService {
  late final _storage;
  final _securedStorage = FlutterSecureStorage();

  @override
  Future<void> init() async {
    await GetStorage.init('postbird');
    _storage = GetStorage('postbird');
  }

  @override
  bool? getBool(String key) {
    return _storage.read<bool>(key);
  }

  @override
  int? getInt(String key) {
    return _storage.read<int>(key);
  }

  @override
  Map<String, dynamic>? getMap(String key) {
    return _storage.read<Map<String, dynamic>>(key);
  }

  @override
  String? getString(String key) {
    return _storage.read<String>(key);
  }

  @override
  List<String>? getStringList(String key) {
    return _storage.read<List<String>>(key);
  }

  @override
  Future<void> saveBool(String key, bool val) async {
    await _storage.write(key, val);
  }

  @override
  Future<void> saveInt(String key, int val) async {
    await _storage.write(key, val);
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> val) async {
    await _storage.write(key, val);
  }

  @override
  Future<void> saveString(String key, String val) async {
    await _storage.write(key, val);
  }

  @override
  Future<void> saveStringList(String key, List<String> val) async {
    await _storage.write(key, val);
  }

  @override
  Future<void> clearAll() async {
    await _storage.erase();
  }

  @override
  Future<void> clearData(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<String?> secureGet(String key) async {
    return await _securedStorage.read(key: key);
  }

  @override
  Future<void> secureSave(String key, String val) async {
    await _securedStorage.write(key: key, value: val);
  }

  @override
  Future<void> clearAllSecured() async {
    await _securedStorage.deleteAll();
  }

  @override
  Future<void> clearSecuredData(String key) async {
    await _securedStorage.delete(key: key);
  }
}
