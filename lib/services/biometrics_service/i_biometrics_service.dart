abstract class IBiometricsService {
  Future<bool> scanFinger();
  Future<bool> checkScannerAvailability();
  Future<void> cancelAuth();
}
