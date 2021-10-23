import 'package:postbird/core/index.dart';

abstract class IActivityRepository {
  Future<int> fetchPrice(Package package);
  Future<void> createOrder(Package package);
  Future<List<Package>> fetchActivity();
}
