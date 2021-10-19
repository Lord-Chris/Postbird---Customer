class Package {
  final String packageName;
  final PackageLocation origin, destination;
  final PackageUser sender, receiver;
  final String? size;
  final bool isFragile;
  final String date;
  final String? note;
  String? price;

  Package({
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
  });

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
}

class PackageLocation {
  final double long, lat;
  final String? address;

  PackageLocation({required this.long, required this.lat, this.address});
}
