import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:place_picker/uuid.dart';
import 'package:postbird/Screens/Sender.dart';
import 'package:postbird/Screens/model/place_model.dart';
import 'package:postbird/Screens/provider/google_map_service.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/home/views/create_package.dart';

class SelectLocationController extends BaseController {
  final _storageService = Get.find<IStorageService>();
  final Key mapKey = UniqueKey();
  final uuid = Uuid();

  final fromLocation = TextEditingController();
  final toLocation = TextEditingController();
  final dateController = TextEditingController();

  PolylinePoints polylinePoints = PolylinePoints();
  GoogleMapServices? googleMapServices;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  LatLng? myLocation;
  GoogleMapController? mapController;
  String? mapStyle;
  String? sessionToken;
  PlaceDetail? _fromPlaceDetail;
  PlaceDetail? _toPlaceDetail;
  DateTime? date;

  @override
  void onInit() {
    super.onInit();
    initMap();

    // mapStyle = await MapUtils.txtToString('assets/images/map_style.txt');
  }

  void initMap() async {
    myLocation = await MapUtils.getMyLocation();
    addToMarker(
        user.id.toString(), "assets/Group3.png", "Your Location", myLocation!);
    update();
  }

  Future<List<Place>> fetchSuggestions(String pattern) async {
    if (sessionToken == null) {
      sessionToken = uuid.generateV4();
    }
    googleMapServices = GoogleMapServices(sessionToken: sessionToken!);
    return await googleMapServices!.getSuggestions(pattern);
  }

  Future<void> selectSuggestion(bool isFrom, Place suggestion) async {
    final placeDetail = await googleMapServices!.getPlaceDetail(
      suggestion.placeId,
      sessionToken!,
    );
    if (isFrom) {
      _fromPlaceDetail = placeDetail;
      _moveCamera(origin: _fromPlaceDetail);
    } else {
      _toPlaceDetail = placeDetail;
      _moveCamera(destination: _toPlaceDetail);
    }
    // _moveCamera(_fromPlaceDetail!, _toPlaceDetail!);
    sessionToken = null;
    update();
  }

  void _moveCamera({PlaceDetail? origin, PlaceDetail? destination}) async {
    if (_fromPlaceDetail == null && _toPlaceDetail == null) {
      markers.clear();
    }
    if (origin != null) {
      _fromPlaceDetail = origin;
      LatLng from = LatLng(_fromPlaceDetail!.lat, _fromPlaceDetail!.lng);
      mapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(origin.lat, origin.lng)),
      );
      addToMarker(origin.placeId, "assets/Courier.png", 'Pick Up', from,
          origin.formattedAddress);
    }
    if (destination != null) {
      _toPlaceDetail = destination;
      LatLng to = LatLng(_toPlaceDetail!.lat, _toPlaceDetail!.lng);
      mapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(destination.lat, destination.lng)),
      );
      addToMarker(destination.placeId, "assets/ReceipentMarker.png",
          'Destination', to, destination.formattedAddress);
    }

    LatLng from = LatLng(_fromPlaceDetail!.lat, _fromPlaceDetail!.lng);
    LatLng to = LatLng(_toPlaceDetail!.lat, _toPlaceDetail!.lng);

    if (_fromPlaceDetail != null && _toPlaceDetail != null)
      await setPolylines(from, to);
  }

  Future<void> setPolylines(LatLng fromLocation, LatLng toLocation) async {
    polylines.clear();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Constants.API_KEY,
      PointLatLng(fromLocation.latitude, fromLocation.longitude),
      PointLatLng(toLocation.latitude, toLocation.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.status == null) {
      MySnackBar.failure(result.errorMessage!);
      return;
    }
    // create a Polyline instance

    Polyline _polyline = Polyline(
      polylineId: PolylineId('poly'),
      color: AppColors.primaryColor,
      width: 4,
      points:
          result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
    );
    polylines.add(_polyline);
  }

  void addToMarker(String id, String image, String title, LatLng loc,
      [String? label]) async {
    final _val = await bitMapFromImage(image);
    markers.add(
      Marker(
        markerId: MarkerId(id),
        position: loc,
        icon: _val,
        infoWindow: InfoWindow(title: title, snippet: label),
      ),
    );
  }

  Future<BitmapDescriptor> bitMapFromImage(String val) async {
    final res = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5, size: Size.fromRadius(50)),
        val);
    return res;
  }

  void onNextTap() {
    if (_toPlaceDetail == null || _fromPlaceDetail == null || date == null)
      return;
    Get.to(() => CreatePackage(
        date: date!, destination: _toPlaceDetail!, origin: _fromPlaceDetail!));
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
