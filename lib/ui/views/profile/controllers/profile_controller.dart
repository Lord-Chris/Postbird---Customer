import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/profile/views/edit_profile.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';

class ProfileController extends BaseController {
  final _storageService = Get.find<IStorageService>();
  final _authRepository = Get.find<IAuthRepository>();

  void navigateToEditProfile() async {
    await Get.to(() => EditProfile());
    update();
  }

  Future<void> signOut() async {
    try {
      // setBusy(true);
      await _authRepository.logOut();
      await _storageService.clearData(StorageKeys.userData);
      await _storageService.clearData(StorageKeys.authToken);
      // setBusy(false);
      Get.offAll(() => Onboarding());
    } catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
  int get sentPackages => _storageService.getInt(StorageKeys.packageCount) ?? 0;
}
