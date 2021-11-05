import 'package:postbird/core/index.dart';

class BiometricsService extends IBiometricsService {
  final _localAuth = LocalAuthentication();
  @override
  Future<bool> checkScannerAvailability() async {
    final _isAvailable = await _localAuth.canCheckBiometrics;
    if (!_isAvailable) return false;
    List _availableMetrics = await _localAuth.getAvailableBiometrics();
    if (_availableMetrics.contains(BiometricType.fingerprint))
      return true;
    else
      return false;
  }

  @override
  Future<bool> scanFinger() async {
    return await _localAuth.authenticate(
      localizedReason: "Authenticate to Sign in",
      biometricOnly: true,
      stickyAuth: true,
    );
  }

  @override
  Future<void> cancelAuth() async {
    await _localAuth.stopAuthentication();
  }
}
