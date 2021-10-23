import 'package:postbird/core/index.dart';

class ActivityController extends BaseController
    with SingleGetTickerProviderMixin {
  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  late final TabController tabController;
  String id = "";
  List<Package> _activities = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    print(_storageService.getString(StorageKeys.authToken));
    fetchActivities();
  }

  void updateIndex(int value) {
    tabController.index = value;
    update();
  }

  Future<void> fetchActivities() async {
    try {
      setBusy(true);
      _activities = await _activityRepo.fetchActivity();
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  int get tabIndex => tabController.index;
  List<Package> get activities => _activities;
}
