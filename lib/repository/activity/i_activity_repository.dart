import 'package:postbird/core/index.dart';

abstract class IActivityRepository {
  Future<Package> fetchPrice(Package package);
  Future<int> createOrder(Package package);
  Future<List<Package>> fetchAllActivities();
  Future<Package> fetchPackageDetails(String id);
  Future<void> findCourier(Package package);
  Stream<bool> streamPackage();
  Future<void> cancelCourierSearch(String packageId);
}
