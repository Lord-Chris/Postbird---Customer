import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/auth/views/login.dart';
import 'package:postbird/ui/views/auth/views/verify_phone.dart';

import '../controller/startup_controller.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<StartupController>(
      init: StartupController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              width: screenWidth,
              // height: screenHeight,
              child: Column(
                children: <Widget>[
                  Spacer(flex: 3),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    width: 131,
                    height: 133,
                    child: Image.asset(
                      'assets/Group.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Spacer(flex: 3),
                  Column(children: [
                    Text(
                      'Welcome to Post Bird',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: 'Manrope',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Deliver your package nationwide \n without hesitation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.6),
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                    ),
                  ]),
                  Spacer(),
                  Container(
                    width: screenWidth,
                    // height: screenHeight,
                    child: Column(
                      children: <Widget>[
                        MyButton(
                          label: 'Login',
                          hasShadow: true,
                          onTap: () {
                            Get.to(() => Login());
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        MyButton(
                          label: 'Register',
                          buttonColor: AppColors.whiteColor,
                          labelColor: AppColors.darkGrey,
                          hasBorder: true,
                          onTap: () {
                            Get.to(() => VerifyPhone());
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Visibility(
                          visible: controller.showFingerPrintButton,
                          child: MyButton(
                            label: 'Continue with FingerPrint',
                            buttonColor: AppColors.mediumGrey,
                            hasShadow: true,
                            onTap: () => controller.fingerprintSignIn(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
