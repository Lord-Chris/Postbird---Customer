import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
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

  static Future<LatLng> getMyLocation() async {
    await GeolocatorPlatform.instance.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final myLocation = LatLng(position.latitude, position.longitude);
    return myLocation;
  }

  static Future<BitmapDescriptor> bitMapFromImage(String val) async {
    final res = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5, size: Size.fromRadius(50)),
        val);
    return res;
  }
}
