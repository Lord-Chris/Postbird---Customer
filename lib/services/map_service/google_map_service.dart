import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postbird/core/index.dart';
import 'package:postbird/models/place_model.dart';

class GoogleMapServices {
  final String sessionToken;

  GoogleMapServices({required this.sessionToken});

  Future<List<Place>> getSuggestions(String query) async {
    final String baseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String type = 'establishment';
    String url =
        '$baseUrl?input=$query&key=${Constants.API_KEY}&type=$type&language=en&components=country:ng&sessiontoken=$sessionToken';

    print('Autocomplete(sessionToken): $sessionToken $url');

    final http.Response response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final predictions = responseData['predictions'];

    List<Place> suggestions = [];

    for (int i = 0; i < predictions.length; i++) {
      final place = Place.fromJson(predictions[i]);
      suggestions.add(place);
    }

    return suggestions;
  }

  Future<PlaceDetail> getPlaceDetail(String placeId, String token) async {
    final String baseUrl =
        'https://maps.googleapis.com/maps/api/place/details/json';
    String url =
        '$baseUrl?key=${Constants.API_KEY}&place_id=$placeId&language=en&sessiontoken=$token';

    print('Place Detail(sessionToken): $sessionToken');
    final http.Response response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final result = responseData['result'];

    final PlaceDetail placeDetail = PlaceDetail.fromJson(result);
    print(placeDetail.toMap());

    return placeDetail;
  }
}
