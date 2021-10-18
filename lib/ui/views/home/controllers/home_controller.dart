import 'package:postbird/core/index.dart';

class HomeController extends BaseController {
  final _storageService = Get.find<IStorageService>();

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
