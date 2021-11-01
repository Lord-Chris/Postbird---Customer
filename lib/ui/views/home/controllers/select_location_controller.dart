import 'dart:async';

import 'package:postbird/models/place_model.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import 'package:postbird/ui/views/home/views/create_package.dart';

class SelectLocationController extends BaseController with Validator {
  final bool searchOnOpen;
  SelectLocationController(this.searchOnOpen, this.package);

  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  final _mapService = Get.find<IMapService>();
  final Key mapKey = UniqueKey();
  final fromLocation = TextEditingController();
  final toLocation = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  StreamSubscription? _streamSub;
  Timer? _timer;
  bool showLocationPicker = true;
  bool findingCourier = false;
  bool showCourierSearchBox = false;
  int searchCount = 60;

  DateTime? date;
  Package? package;

  set mapController(val) => _mapService.mapController = val;

  @override
  void onInit() {
    super.onInit();
    if (searchOnOpen) {
      startSearch();
    }
    initMap();
  }

  void initMap() async {
    await _mapService.initMap(user.id.toString());
    update();
  }

  void onNextTap() async {
    if (!formKey.currentState!.validate()) return;
    if (_toPlaceDetail == null || _fromPlaceDetail == null)
      return MySnackBar.failure("Fill all fields");
    package = await Get.to(() => CreatePackage(
        date: date!, destination: _toPlaceDetail!, origin: _fromPlaceDetail!));
    if (package != null) {
      startSearch();
    }
  }

  void startSearch() async {
    try {
      await _activityRepo.findCourier(package!);
      _streamSub = _activityRepo.streamPackage().listen(_handlePackageStream);
      showCourierSearchBox = findingCourier = true;
      showLocationPicker = false;
      startCountDown();
      update();
    } catch (e) {
      print(e.toString());
      MySnackBar.failure(e.toString());
    }
  }

  void onCourierSearchButtonTap() {
    if (findingCourier)
      cancelSearch();
    else
      searchAgain();
  }

  void startCountDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (searchCount > 0) {
        searchCount--;
        update(["countdown"]);
      } else {
        await cancelSearch();
      }
      _timer = timer;
    });
  }

  void _handlePackageStream(bool packageExists) {
    if (!packageExists) {
      Get.offAll(() => PackageDetailView(package: package!),
          predicate: (route) => route.isFirst);
      MySnackBar.success("Courier Found");
    }
  }

  Future<void> cancelSearch() async {
    _streamSub?.cancel();
    _timer?.cancel();
    _timer = null;
    searchCount = 60;
    await _activityRepo.cancelCourierSearch("${package!.id}");
    findingCourier = false;
    // _refId = null;
    update(["Courier Search"]);
  }

  Future<void> searchAgain() async {
    try {
      searchCount = 60;
      _streamSub = _activityRepo.streamPackage().listen(_handlePackageStream);
      await _activityRepo.findCourier(package!);
      findingCourier = true;
      startCountDown();
      update(["Courier Search"]);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  Future<List<Place>> fetchSuggestions(String pattern) async {
    return await _mapService.fetchSuggestions(pattern);
  }

  Future<void> selectSuggestion(bool isFrom, Place suggestion) async {
    await _mapService.selectSuggestion(isFrom, suggestion);
    update();
  }

  @override
  void onClose() {
    if (findingCourier) {
      cancelSearch();
    }
    _streamSub?.cancel();
    super.onClose();
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
  Set<Marker> get markers => _mapService.markers;
  Set<Polyline> get polylines => _mapService.polylines;
  LatLng? get myLocation => _mapService.myLocation;
  GoogleMapController? get mapController => _mapService.mapController;
  PlaceDetail? get _fromPlaceDetail => _mapService.fromPlaceDetail;
  PlaceDetail? get _toPlaceDetail => _mapService.toPlaceDetail;
}
