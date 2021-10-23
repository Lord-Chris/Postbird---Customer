import 'package:postbird/core/api_strings.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/models/package.dart';

class ActivityRepository extends IActivityRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();

  @override
  Future<void> createOrder(Package package) async {
    try {
      Map<String, dynamic> body = package.toMap();
      final headers = {"Authorization": "Bearer $token"};
      body.addAll({'stype': 2});
      await _networkService.post(ApiStrings.processOrder,
          body: body, headers: headers);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<int> fetchPrice(Package package) async {
    try {
      Map<String, dynamic> body = package.toPriceMap();
      final headers = {"Authorization": "Bearer $token"};
      final res = await _networkService.post(ApiStrings.priceCheck,
          body: body, headers: headers);
      return res!.data['price'];
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  String? get token => _storageService.getString(StorageKeys.authToken);

  @override
  Future<List<Package>> fetchActivity() async {
    try {
      List<Package> _actvities = [];

      final headers = {"Authorization": "Bearer $token"};
      final res = await _networkService.get(ApiStrings.fetchActivities,
          headers: headers);
      List<Package> inProgress = (res!.data['progress'] as List)
          .map((e) => Package.fromJson(e)..isComplete = false)
          .toList();
      List<Package> complete = (res.data['complete'] as List)
          .map((e) => Package.fromJson(e)..isComplete = false)
          .toList();
      _actvities.addAll(inProgress);
      _actvities.addAll(complete);
      return _actvities;
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }
}
