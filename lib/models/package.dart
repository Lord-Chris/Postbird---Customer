import 'package:postbird/core/index.dart';

class Package {
  int? id;
  String? userId, code, courierId;
  String packageName;
  String packageDetails;
  PackageLocation origin, destination;
  PackageUser sender, receiver;
  String? size;
  bool isFragile;
  String date;
  String? note;
  int? price;
  PackageStatus? packageStatus;
  String? type, distance, totalDuration;
  Courier? courier;

  Package({
    this.id,
    this.userId,
    required this.packageName,
    required this.packageDetails,
    required this.origin,
    required this.destination,
    required this.sender,
    required this.receiver,
    this.size,
    required this.isFragile,
    required this.date,
    this.note,
    this.price,
    this.packageStatus,
    this.type,
    this.courier,
    this.distance,
    this.totalDuration,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      userId: json['user_id'],
      type: json['packtype'],
      price: double.parse(json['amount']).toInt(),
      packageName: json['packagename'],
      packageDetails: json['packagedetails'],
      sender: PackageUser(
        name: json['sendername'],
        phone: json['senderphone'],
        address: json["address"],
      ),
      receiver: PackageUser(
        name: json['recipientname'],
        phone: json['recipientphone'],
        address: json['recipientaddress'],
      ),
      date: json['date'],
      note: json['additionalinfo'],
      distance: json['distance'],
      // totalDuration: json['duration'],
      size: json['packsize'],
      origin: PackageLocation(
        long: double.parse(json['frmlg']),
        lat: double.parse(json['frmlt']),
        address: json['address'],
      ),
      destination: PackageLocation(
        long: double.parse(json['tolg']),
        lat: double.parse(json['tolt']),
        address: json['destination'],
      ),
      isFragile: json['fragile'] == '1' ? true : false,
      packageStatus: GenUtils.stringToPackageStatus(json['status']),
      courier: json['courier'] != null
          ? Courier.fromJson(json['courier']['driver'])
          : null,
    );
  }

  Map<String, dynamic> toPriceMap() {
    return {
      'from': origin.address,
      'to': destination.address,
      'size': 'large',
    };
  }

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        "packagename": packageName,
        "packagedetails": packageDetails,
        "packtype": type,
        "packsize": size,
        "fragile": isFragile,
        "date": date,
        "amount": price,
        "additionalinfo": note ?? '',
        "sendername": sender.name,
        "address": sender.address,
        "senderphone": sender.phone,
        "recipientname": receiver.name,
        "recipientaddress": receiver.address,
        "recipientphone": receiver.phone,
        "postalzip": receiver.postCode,
        "destination": destination.address,
        "distance": distance,
        "duration": totalDuration,
        "frmlt": origin.lat,
        "tolt": destination.lat,
        "frmlg": origin.long,
        "tolg": destination.long,
      };
}

class Courier {
  final int id;
  final String name, email, username, phone, photo;
  String? distance, duration;

  Courier({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.photo,
    this.distance,
    this.duration,
  });

  factory Courier.fromJson(Map<String, dynamic> json) {
    return Courier(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['mobile'],
      photo: Constants.PHOTOS_BASEURL + json['profilepic'],
    );
  }
}

class PackageUser {
  final String name, phone, address;
  final String? postCode;

  PackageUser({
    required this.name,
    required this.phone,
    required this.address,
    this.postCode,
  });

  // factory PackageUser.fromJson(Map<String, dynamic> json){
  // return PackageUser(name: "sendername", phone: "senderphone", address: "");
  // }
}

class PackageLocation {
  final double long, lat;
  final String? address;

  PackageLocation({required this.long, required this.lat, this.address});

  LatLng get toLatLng => LatLng(lat, long);

  @override
  String toString() {
    return '$address $lat $long';
  }
}
