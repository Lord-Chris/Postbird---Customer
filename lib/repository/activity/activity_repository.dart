import 'package:firebase_database/firebase_database.dart';
import 'package:postbird/core/index.dart';

class ActivityRepository extends IActivityRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String? _refId;

  @override
  Future<int> createOrder(Package package) async {
    try {
      Map<String, dynamic> body = package.toMap();
      final headers = {"Authorization": "Bearer $token"};
      body.addAll({'stype': 2});
      final res = await _networkService.post(ApiStrings.processOrder,
          body: body, headers: headers);
      package.id = res!.data['data']['id'];
      await findCourier(package);
      return package.id!;
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<Package> fetchPrice(Package package) async {
    try {
      Map<String, dynamic> body = package.toPriceMap();
      final headers = {"Authorization": "Bearer $token"};
      final res = await _networkService.post(ApiStrings.priceCheck,
          body: body, headers: headers);
      package
        ..price = res!.data['price']
        ..distance = res.data['data']['distance'];
      return package;
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<List<Package>> fetchAllActivities() async {
    try {
      List<Package> _actvities = [];

      final headers = {"Authorization": "Bearer $token"};
      final res = await _networkService.get(ApiStrings.fetchActivities,
          headers: headers);
      List<Package> inProgress = (res!.data['progress'] as List)
          .map((e) => Package.fromJson(e))
          .toList();
      List<Package> complete = (res.data['complete'] as List)
          .map((e) => Package.fromJson(e))
          .toList();
      _actvities.addAll(inProgress);
      _actvities.addAll(complete);
      _storageService.saveInt(
          StorageKeys.packageCount, complete.length + inProgress.length);
      return _actvities;
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<Package> fetchPackageDetails(String id) async {
    try {
      final headers = {"Authorization": "Bearer $token"};
      final res = await _networkService.get(ApiStrings.packageDetails + id,
          headers: headers);
      // log(res!.data.toString());
      return Package.fromJson(res?.data['data']);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> findCourier(Package package) async {
    try {
      // call find driver endpoint and fetch package ID
      final _headers = {"Authorization": "Bearer $token"};
      final _res = await _networkService
          .get("${ApiStrings.findDriver}${package.id}", headers: _headers);
      final _packageId = _res!.data['data']['package_id'];

      // Get the ref ID on the database
      Iterable<MapEntry> _data = (await packagePath.get()).value.entries;
      final _val = _data.lastWhere((e) => e.value['package_id'] == _packageId);
      _refId = _val.key;
    } on Failure {
      rethrow;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Stream<bool> streamPackage() {
    final snapshots = packagePath.child(_refId!);
    return snapshots.onChildRemoved
        .transform(RepoUtils.packageTransformer(_refId!));
  }

  @override
  Future<void> cancelCourierSearch(String packageId) async {
    try {
      //check for remnant data with same id and delete
      Iterable<MapEntry>? allData = (await packagePath.get()).value?.entries;
      final _badData =
          allData?.where((e) => "${e.value['package_id']}" == packageId);
      if (_badData != null && _badData.isNotEmpty) {
        for (MapEntry element in _badData) {
          await packagePath.child(element.key).remove();
        }
      }
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  String? get token => _storageService.getString(StorageKeys.authToken);
  DatabaseReference get packagePath =>
      _database.reference().child("drivers/available_packages");
}
