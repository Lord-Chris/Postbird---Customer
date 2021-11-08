import 'package:postbird/core/index.dart';

class BiometricsService extends IBiometricsService {
  final _localAuth = LocalAuthentication();
  final _storageService = Get.find<IStorageService>();
  bool _scanisAvailable = false;
  @override
  Future<bool> checkScannerAvailability() async {
    final _isAvailable = await _localAuth.canCheckBiometrics;
    if (!_isAvailable) return false;
    List _availableMetrics = await _localAuth.getAvailableBiometrics();
    if (_availableMetrics.contains(BiometricType.fingerprint)) {
      final _email = await _storageService.secureGet(StorageKeys.storedEmail);
      final _password =
          await _storageService.secureGet(StorageKeys.storedPassword);
      if (_email != null && _password != null) {
        _scanisAvailable = true;
        return true;
      }
    }
    return false;
  }

  @override
  Future<bool> scanFinger() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: "Authenticate to Sign in",
        biometricOnly: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> cancelAuth() async {
    await _localAuth.stopAuthentication();
  }

  @override
  bool get scanisAvailable => _scanisAvailable;
}
