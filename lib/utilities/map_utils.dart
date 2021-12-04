import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as Geocoding;
import 'package:postbird/core/index.dart';

class MapUtils {
  static Future<Uint8List> getMarker() async {
    ByteData byteData = await rootBundle.load("assets/Courier.png");
    return byteData.buffer.asUint8List();
  }

  static Future<String> txtToString(String val) async {
    final res = await rootBundle.loadString(val);
    return res;
  }

  static Future<PackageLocation> getMyLocation() async {
    await GeolocatorPlatform.instance.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.best);
    final places = await Geocoding.placemarkFromCoordinates(
        position.latitude, position.longitude);
    var first = places.first;
    return PackageLocation(
      lat: position.latitude,
      long: position.longitude,
      address:
          "${first.name} ${first.thoroughfare} ${first.subAdministrativeArea} ${first.locality}",
    );
  }

  static Future<BitmapDescriptor> bitMapFromImage(String val) async {
    final res = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5, size: Size.fromRadius(50)),
        val);
    return res;
  }
}
