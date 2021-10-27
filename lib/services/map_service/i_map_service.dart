import 'package:postbird/core/index.dart';

abstract class IMapService {
  set mapController(val);

  Future<void> initMap(String id);
  Future<List<Place>> fetchSuggestions(String pattern);
  Future<void> selectSuggestion(bool isFrom, Place suggestion);
  
  Set<Marker> get markers;
  Set<Polyline> get polylines;
  LatLng? get myLocation;
  GoogleMapController? get mapController;
  String? get sessionToken;
  PlaceDetail? get fromPlaceDetail;
  PlaceDetail? get toPlaceDetail;
}
