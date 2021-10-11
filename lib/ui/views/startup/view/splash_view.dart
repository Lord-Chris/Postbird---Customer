import 'package:postbird/core/index.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: AppColors.primaryColor,
                ),
                Container(
                  child: Center(
                    child: Image.asset("assets/iconframe.png"),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: SpinKitThreeInOut(
                    color: AppColors.whiteColor,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
