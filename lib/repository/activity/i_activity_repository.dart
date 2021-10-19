import 'package:postbird/core/index.dart';

abstract class IActivityRepository {
  Future fetchPrice(Package package);
  Future<void> createOrder(Package package);
}
