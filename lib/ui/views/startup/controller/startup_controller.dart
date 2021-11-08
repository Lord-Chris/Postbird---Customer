import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';
import 'package:postbird/core/index.dart';

class StartupController extends GetxController {
  final _storageService = Get.find<IStorageService>();
  final _biometricsService = Get.find<IBiometricsService>();
  final _authRepository = Get.find<IAuthRepository>();

  late String? _email, _password;
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

  Future<void> fingerprintSignIn() async {
    try {
      bool res = await _biometricsService.scanFinger();
      if (res) {
        _email = await _storageService.secureGet(StorageKeys.storedEmail);
        _password = await _storageService.secureGet(StorageKeys.storedPassword);
        final user = await _authRepository.loginUser(_email!, _password!);
        await _storageService.saveMap(StorageKeys.userData, user.toJson());
        Get.offAll(() => NavBar());
      }
    } catch (e) {
      MySnackBar.failure(e.toString());
    }
  }

  @override
  void onClose() async {
    _biometricsService.cancelAuth();
    super.onClose();
  }

  String? get token => _storageService.getString(StorageKeys.authToken);
  bool get showFingerPrintButton => _biometricsService.scanisAvailable;
}
