import 'package:postbird/core/index.dart';
import 'package:postbird/services/storage_service/i_storage_service.dart';
import 'package:postbird/services/storage_service/storage_service.dart';

Future<void> setUpServices() async {
  print('INITIALIZING DEPENDNCIES...');
  // Services
  Get.lazyPut<INetworkService>(() => NetworkService(), fenix: true);
  Get.lazyPut<IStorageService>(() => StorageService(), fenix: true);

  // repositories
  Get.lazyPut<IAuthRepository>(() => AuthRepository(), fenix: true);
}
