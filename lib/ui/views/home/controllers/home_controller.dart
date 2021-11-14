import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import '../views/select_location.dart';

class HomeController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  final packageCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchActivities();
    super.onInit();
  }

  Future<void> fetchActivities() async {
    try {
      setBusy(true);
      await _activityRepo.fetchAllActivities();
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

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
  List<Package> get activities => _activityRepo.activities;

  Future<double> getDeliveryProgress(Package package) async {
    try {
      package = await _activityRepo.fetchCourierLocation(package);
      final totalDistance =
          double.parse(package.distance?.replaceAll(r' km', '') ?? "0");
      final driverDistance = double.parse(
          package.courier?.distance?.replaceAll(r' km', '') ?? "0");
      if (totalDistance < driverDistance) return 0;
      return driverDistance / totalDistance;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}
