import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';
import 'package:postbird/core/index.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(seconds: 5),
      () => Get.to(() => getPref() == null ? Onboarding() : HomePage()),
    );
  }

  String? getPref() {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // setState(() {
    //   value = preferences.getInt("value")!;
    // });

    // print(value);
  }
}
