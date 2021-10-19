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
  Future fetchPrice(Package package) async {
    try {
      Map<String, dynamic> body = package.toPriceMap();
      final headers = {"Authorization": "Bearer $token"};
      final res = await _networkService.post(ApiStrings.priceCheck,
          body: body, headers: headers);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  String? get token => _storageService.getString(StorageKeys.authToken);
}
