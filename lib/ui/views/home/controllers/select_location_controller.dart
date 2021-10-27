import 'dart:async';

import 'package:postbird/models/place_model.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/home/views/create_package.dart';

class SelectLocationController extends BaseController {
  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  final _mapService = Get.find<IMapService>();
  final Key mapKey = UniqueKey();

  final fromLocation = TextEditingController();
  final toLocation = TextEditingController();
  final dateController = TextEditingController();

  DateTime? date;
  bool showLocationPicker = true;
  bool findingCourier = false;
  bool showCourierSearchBox = false;
  int searchCount = 20;

  set mapController(val) => _mapService.mapController = val;

  @override
  void onInit() {
    super.onInit();
    initMap();
  }

  void initMap() async {
    await _mapService.initMap(user.id.toString());
    update();
  }

  void onNextTap() async {
    if (_toPlaceDetail == null || _fromPlaceDetail == null || date == null)
      return;
    findingCourier = showCourierSearchBox = await Get.to(() => CreatePackage(
            date: date!,
            destination: _toPlaceDetail!,
            origin: _fromPlaceDetail!)) ??
        false;

    if (findingCourier) {
      showLocationPicker = false;
      update();
    }
  }

  void onCancelTap() {
    _activityRepo.cancelCourierSearch("package");
    findingCourier = false;
  }

  Future<List<Place>> fetchSuggestions(String pattern) async {
    return await _mapService.fetchSuggestions(pattern);
  }

  Future<void> selectSuggestion(bool isFrom, Place suggestion) async {
    await _mapService.selectSuggestion(isFrom, suggestion);
    update();
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
  Set<Marker> get markers => _mapService.markers;
  Set<Polyline> get polylines => _mapService.polylines;
  LatLng? get myLocation => _mapService.myLocation;
  GoogleMapController? get mapController => _mapService.mapController;
  PlaceDetail? get _fromPlaceDetail => _mapService.fromPlaceDetail;
  PlaceDetail? get _toPlaceDetail => _mapService.toPlaceDetail;
}
