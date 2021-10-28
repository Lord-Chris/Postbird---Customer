import 'dart:async';

import 'package:postbird/models/place_model.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import 'package:postbird/ui/views/home/views/create_package.dart';

class SelectLocationController extends BaseController with Validator {
  final bool searchOnOpen;
  SelectLocationController(this.searchOnOpen);

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
  Package? _package;

  set mapController(val) => _mapService.mapController = val;

  @override
  void onInit() {
    super.onInit();
    if (searchOnOpen) {
      startSearch();
      return;
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
    _package = await Get.to(() => CreatePackage(
        date: date!, destination: _toPlaceDetail!, origin: _fromPlaceDetail!));
    if (_package != null) {
      startSearch();
    }
  }

  void startSearch() async {
    await _activityRepo.findCourier(_package!);
    showCourierSearchBox = findingCourier = true;
    showLocationPicker = false;
    startCountDown();
    update();
    _streamSub = _activityRepo
        .streamPackage("${_package!.id!}")
        .listen(_handlePackageStream);
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
        _timer?.cancel();
      }
    });
  }

  void _handlePackageStream(bool packageExists) {
    if (!packageExists) {
      MySnackBar.success("Courier Found");
      Get.offAll(() => PackageDetailView(package: _package!),
          predicate: (route) => route.isFirst);
    }
  }

  Future<void> cancelSearch() async {
    _streamSub?.cancel();
    await _activityRepo.cancelCourierSearch("${_package!.id!}");
    findingCourier = false;
    update(["Courier Search"]);
  }

  Future<void> searchAgain() async {
    try {
      searchCount = 60;
      _streamSub = _activityRepo
          .streamPackage("${_package!.id!}")
          .listen(_handlePackageStream);
      await _activityRepo.findCourier(_package!);
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
