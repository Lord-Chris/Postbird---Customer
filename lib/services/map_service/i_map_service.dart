import 'package:postbird/core/index.dart';

abstract class IMapService {
  set mapController(val);

  Future<void> initMap(String id);
  Future<List<Place>> fetchSuggestions(String pattern);
  Future<void> selectSuggestion(bool isFrom, Place suggestion);
  Future<void> setPolylines(LatLng fromLocation, LatLng toLocation);
  Future<void> addToMarker(String id, String image, String title, LatLng loc,
      [String? label]);

  Set<Marker> get markers;
  Set<Polyline> get polylines;
  PackageLocation? get myLocation;
  GoogleMapController? get mapController;
  PlaceDetail? get fromPlaceDetail;
  PlaceDetail? get toPlaceDetail;
}
