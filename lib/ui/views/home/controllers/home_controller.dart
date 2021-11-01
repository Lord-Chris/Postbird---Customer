import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import '../views/select_location.dart';

class HomeController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  final packageCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void trackPackage() async {
    try {
      if (!formKey.currentState!.validate()) return;
      setBusy(true);
      final res =
          await _activityRepo.fetchPackageDetails(packageCont.text.trim());
      if (res.packageStatus == PackageStatus.notAssigined)
        Get.to(() => SelectLocation(package: res));
      else
        Get.to(() => PackageDetailView(package: res));
      setBusy(false);
    } catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  void onCloseTrackPackage() {
    packageCont.clear();
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
