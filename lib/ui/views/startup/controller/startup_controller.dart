import 'package:postbird/ui/views/main_view/main_view.dart';
import 'package:postbird/ui/views/startup/view/onboarding_one.dart';
import 'package:postbird/ui/views/startup/view/onboarding_two.dart';
import 'package:postbird/core/index.dart';

class StartupController extends GetxController {
  final _storageService = Get.find<IStorageService>();
  final _biometricsService = Get.find<IBiometricsService>();
  final pageController = PageController();
  int onboardIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    await checkforBiometrics();
    if (Get.currentRoute is OnboardingTwo) return;
    if (Get.rawRoute != null)
      Future.delayed(
        Duration(seconds: 2),
        () => Get.off(() {
          if (showOnboarding) {
            return OnboardingOne();
          }
          if (token == null) {
            return OnboardingTwo();
          } else {
            return MainView();
          }
        }),
      );
  }

  Future checkforBiometrics() async {
    await _biometricsService.checkScannerAvailability();
  }

  void onSkipTap() async {
    await _storageService.saveBool(StorageKeys.showOnboarding, false);
    Get.off(() => OnboardingTwo());
  }

  void onContinueTap() {
    if (onboardIndex == 2)
      onSkipTap();
    else {
      onboardIndex++;
      update();
    }
  }

  @override
  void onClose() async {
    _biometricsService.cancelAuth();
    // pageController.dispose();
    super.onClose();
  }

  String? get token => _storageService.getString(StorageKeys.authToken);
  bool get showOnboarding =>
      _storageService.getBool(StorageKeys.showOnboarding) ?? true;
}
