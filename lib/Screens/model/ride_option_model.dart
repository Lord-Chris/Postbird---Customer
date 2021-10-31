
class RideOptionModel {
  final String id;
  final int index;
  final double price;
  final String estimatedTime;
  final String rideType;
  final String imageUrl;

  RideOptionModel(
      {required this.id,
      required this.index,
      required this.price,
      required this.estimatedTime,
      required this.rideType,
      required this.imageUrl});
}
