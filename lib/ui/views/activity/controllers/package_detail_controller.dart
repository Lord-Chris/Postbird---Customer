import 'package:postbird/core/index.dart';

class PackageDetailController extends BaseController {
  PackageDetailController({required this.package});

  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  final _mapService = Get.find<IMapService>();
  final Key mapKey = UniqueKey();
  final Package package;

  set mapController(val) => _mapService.mapController = val;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initMap();
    });
  }

  Future<void> initMap() async {
    await _mapService.addToMarker("origin", "assets/Courier.png", 'Pick Up',
        origin, package.origin.address);
    await _mapService.addToMarker("destination", "assets/ReceipentMarker.png",
        'Destination', destination, package.destination.address);
    await _mapService.setPolylines(origin, destination);
    update();
  }

  LatLng get origin => LatLng(package.origin.lat, package.origin.long);
  LatLng get destination =>
      LatLng(package.destination.lat, package.destination.long);
  Set<Marker> get markers => _mapService.markers;
  Set<Polyline> get polylines => _mapService.polylines;
}
