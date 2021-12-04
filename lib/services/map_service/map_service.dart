import 'package:postbird/core/index.dart';

class MapService extends IMapService {
  // final Key _mapKey = UniqueKey();
  final _uuid = Uuid();
  final PolylinePoints _polylinePoints = PolylinePoints();

  GoogleMapServices? _googleMapServices;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  PackageLocation? _myLocation;
  GoogleMapController? _mapController;
  // String? mapStyle;
  String? _sessionToken;
  PlaceDetail? _fromPlaceDetail;
  PlaceDetail? _toPlaceDetail;

  set mapController(val) => _mapController = val;

  @override
  Future<void> initMap(String id) async {
    _myLocation = await MapUtils.getMyLocation();
    _markers.clear();
    await addToMarker(id, "assets/Group3.png", "Your Location", _myLocation!.toLatLng);
  }

  @override
  Future<List<Place>> fetchSuggestions(String pattern) async {
    try {
      if (_sessionToken == null) {
        _sessionToken = _uuid.generateV4();
      }
      _googleMapServices = GoogleMapServices(sessionToken: _sessionToken!);
      return await _googleMapServices!.getSuggestions(pattern);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> selectSuggestion(bool isFrom, Place suggestion) async {
    try {
      final placeDetail = await _googleMapServices!.getPlaceDetail(
        suggestion.placeId,
        _sessionToken!,
      );
      _sessionToken = null;
      if (isFrom) {
        _fromPlaceDetail = placeDetail;
        await _moveCamera(origin: _fromPlaceDetail);
      } else {
        _toPlaceDetail = placeDetail;
        await _moveCamera(destination: _toPlaceDetail);
      }
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  Future<void> _moveCamera(
      {PlaceDetail? origin, PlaceDetail? destination}) async {
    // if (_fromPlaceDetail == null && _toPlaceDetail == null) {
    //   _markers.clear();
    // }
    if (origin != null) {
      _fromPlaceDetail = origin;
      LatLng from = LatLng(_fromPlaceDetail!.lat, _fromPlaceDetail!.lng);
      await _mapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(origin.lat, origin.lng)),
      );
      await addToMarker(origin.placeId, "assets/Courier.png", 'Pick Up', from,
          origin.formattedAddress);
    }
    if (destination != null) {
      _toPlaceDetail = destination;
      LatLng to = LatLng(_toPlaceDetail!.lat, _toPlaceDetail!.lng);
      await _mapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(destination.lat, destination.lng)),
      );
      await addToMarker(destination.placeId, "assets/ReceipentMarker.png",
          'Destination', to, destination.formattedAddress);
    }
  }

  @override
  Future<void> setPolylines(LatLng fromLocation, LatLng toLocation) async {
    _polylines.clear();

    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
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
    _polylines.add(_polyline);
  }

  @override
  Future<void> addToMarker(String id, String image, String title, LatLng loc,
      [String? label]) async {
    final _val = await MapUtils.bitMapFromImage(image);
    _markers.add(
      Marker(
        markerId: MarkerId(id),
        position: loc,
        icon: _val,
        infoWindow: InfoWindow(title: title, snippet: label),
      ),
    );
  }

  @override
  Set<Marker> get markers => _markers;
  @override
  Set<Polyline> get polylines => _polylines;
  @override
  PackageLocation? get myLocation => _myLocation;
  @override
  GoogleMapController? get mapController => _mapController;
  @override
  PlaceDetail? get fromPlaceDetail => _fromPlaceDetail;
  @override
  PlaceDetail? get toPlaceDetail => _toPlaceDetail;
}
