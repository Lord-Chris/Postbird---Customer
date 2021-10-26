import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';
import 'package:postbird/core/index.dart';

class SplashController extends GetxController {
  final _storageService = Get.find<IStorageService>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(seconds: 3),
      () => Get.off(() => token == null ? Onboarding() : NavBar()),
    );
  }

  String? get token =>
      null; // _storageService.getString(StorageKeys.authToken);
}
