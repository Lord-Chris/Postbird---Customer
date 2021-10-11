import 'package:postbird/core/index.dart';

Future<void> setUpServices() async {
  print('INITIALIZING DEPENDNCIES...');
  // Services
  Get.lazyPut<INetworkService>(() => NetworkService(), fenix: true);

  // repositories
  Get.lazyPut<IAuthRepository>(() => AuthRepository(), fenix: true);
}
