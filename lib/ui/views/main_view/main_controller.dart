import 'package:postbird/core/index.dart';

class MainController extends BaseController {
  final _authRepo = Get.find<IAuthRepository>();
  final _storageService = Get.find<IStorageService>();
  int currentIndex = 0;
  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  void onTappedBar(int index) {
    currentIndex = index;
    update();
  }

  Future<void> fetchUserDetails() async {
    User _user = await _authRepo.fetchUserData();
    await _storageService.saveMap(StorageKeys.userData, _user.toJson());
    update();
  }
}
