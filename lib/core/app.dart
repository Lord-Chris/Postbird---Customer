import 'package:postbird/core/index.dart';

Future<void> setUpServices() async {
  print('INITIALIZING DEPENDNCIES...');
  // Services
  Get.lazyPut<INetworkService>(() => NetworkService(), fenix: true);
  Get.lazyPut<IStorageService>(() => StorageService(), fenix: true);
  Get.lazyPut<IMediaService>(() => MediaService(), fenix: true);

  // repositories
  Get.lazyPut<IAuthRepository>(() => AuthRepository(), fenix: true);
  Get.lazyPut<IActivityRepository>(() => ActivityRepository(), fenix: true);
}
