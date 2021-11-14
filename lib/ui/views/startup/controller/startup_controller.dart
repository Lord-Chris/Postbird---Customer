import 'package:postbird/Screens/Home3.dart';
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
            return NavBar();
          }
        }),
      );
  }

  Future checkforBiometrics() async {
    await _biometricsService.checkScannerAvailability();
  }

  void onSkipTap() async {
    // onboardIndex = 0;
    // update();
    await _storageService.saveBool(StorageKeys.showOnboarding, false);
    Get.off(() => OnboardingTwo());
  }

  void onContinueTap() {
    if (onboardIndex == 2)
      onSkipTap();
    else {
      // pageController.animateTo(onboardIndex.toDouble() + 1,
      //     duration: Duration(microseconds: 500), curve: Curves.easeIn);
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
