class Package {
  String? id;
  int? userId;
  String packageName;
  String packageDetails;
  PackageLocation origin, destination;
  PackageUser sender, receiver;
  String? size;
  bool isFragile;
  String date;
  String? note;
  int? price;
  bool? isComplete;
  int? type;

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
    this.isComplete,
    this.type,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
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
      size: json['packsize'],
      origin: PackageLocation(
        long: double.parse(json['frmlg']),
        lat: double.parse(json['frmlt']),
      ),
      destination: PackageLocation(
        long: double.parse(json['tolg']),
        lat: double.parse(json['tolt']),
        address: json['detination'],
      ),
      isFragile: true,
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
        "frmlt": origin.lat,
        "tolt": destination.lat,
        "frmlg": origin.long,
        "tolg": destination.long,
      };
}

// `user_id`, `detination`, `status`,

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
}
