import 'package:postbird/core/index.dart';

Future<void> setUpServices() async {
  print('INITIALIZING DEPENDNCIES...');
  // Services
  await _setupStorageSevice();
  Get.lazyPut<INetworkService>(() => NetworkService(), fenix: true);
  Get.lazyPut<IMediaService>(() => MediaService(), fenix: true);
  Get.lazyPut<IMapService>(() => MapService(), fenix: true);
  Get.lazyPut<ICallService>(() => CallService(), fenix: true);
  Get.lazyPut<IBiometricsService>(() => BiometricsService(), fenix: true);

  // repositories
  Get.lazyPut<IAuthRepository>(() => AuthRepository(), fenix: true);
  Get.lazyPut<IActivityRepository>(() => ActivityRepository(), fenix: true);
  Get.lazyPut<IInboxRepository>(() => InboxRepository(), fenix: true);
  Get.lazyPut<INotificationRepository>(() => NotificationRepository(), fenix: true);
}

Future _setupStorageSevice() async {
  final res = StorageService();
  await res.init();
  Get.lazyPut<IStorageService>(() => res, fenix: true);
}
