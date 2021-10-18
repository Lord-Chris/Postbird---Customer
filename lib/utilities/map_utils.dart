import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:postbird/core/index.dart';

class MapUtils {
  static Future<Uint8List> getMarker() async {
    ByteData byteData = await rootBundle.load("assets/Courier.png");

    // await DefaultAssetBundle.of(context).load("assets/images/car_icon.png");
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
}
