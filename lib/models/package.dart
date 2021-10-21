class Package {
  String? id;
  String packageName;
  PackageLocation origin, destination;
  PackageUser sender, receiver;
  String? size;
  bool isFragile;
  String date;
  String? note;
  String? price;
  bool? isComplete;

  Package({
    this.id,
    required this.packageName,
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
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageName: json['packagename'],
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
      'size': 'heavy',
    };
  }

  Map<String, dynamic> toMap() => {
        "sname": sender.name,
        "spaddress": sender.address,
        "stype": "explicabo",
        "packagesize": size,
        "spfragile": isFragile,
        "sphone": sender.phone,
        "date": date,
        "packagename": packageName,
        "rname": receiver.name,
        "rpaddress": receiver.address,
        "rpostal": receiver.postCode,
        "rphone": receiver.phone,
        "radnote": note,
        "frmlt": origin.lat,
        "tolt": destination.lat,
        "frmlg": origin.long,
        "tolg": destination.long,
        "credits": price,
      };
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
}
