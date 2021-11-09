import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';
import 'package:postbird/core/index.dart';

class StartupController extends GetxController {
  final _storageService = Get.find<IStorageService>();
  final _biometricsService = Get.find<IBiometricsService>();

  @override
  void onInit() async {
    super.onInit();
    await checkforBiometrics();
    if (Get.rawRoute != null)
      Future.delayed(
        Duration(seconds: 2),
        () => Get.off(() => token == null ? Onboarding() : NavBar()),
      );
  }

  Future checkforBiometrics() async {
    await _biometricsService.checkScannerAvailability();
  }

  @override
  void onClose() async {
    _biometricsService.cancelAuth();
    super.onClose();
  }

  String? get token => _storageService.getString(StorageKeys.authToken);
}
