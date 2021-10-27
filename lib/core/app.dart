import 'package:postbird/core/index.dart';

Future<void> setUpServices() async {
  print('INITIALIZING DEPENDNCIES...');
  // Services
  await _setupStorageSevice();
  Get.lazyPut<INetworkService>(() => NetworkService(), fenix: true);
  Get.lazyPut<IMediaService>(() => MediaService(), fenix: true);
  Get.lazyPut<IMapService>(() => MapService(), fenix: true);

  // repositories
  Get.lazyPut<IAuthRepository>(() => AuthRepository(), fenix: true);
  Get.lazyPut<IActivityRepository>(() => ActivityRepository(), fenix: true);
}

Future _setupStorageSevice() async {
  final res = StorageService();
  await res.init();
  Get.lazyPut<IStorageService>(() => res, fenix: true);
}
