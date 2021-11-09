import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:postbird/core/index.dart';

import 'ui/views/startup/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setUpServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Banner(
        location: BannerLocation.topEnd,
        message: kDebugMode ? "DEBUG" : "RELEASE",
        child: SplashView(),
      ),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.primaryColor,
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
      ),
    );
  }
}
