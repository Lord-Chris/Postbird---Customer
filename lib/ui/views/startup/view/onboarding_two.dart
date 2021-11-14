import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/auth/views/login.dart';
import 'package:postbird/ui/views/auth/views/verify_phone.dart';

import '../controller/startup_controller.dart';

class OnboardingTwo extends StatelessWidget {
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
                  Spacer(flex: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/Group.png',
                    ),
                  ),
                  Spacer(flex: 2),
                  Column(children: [
                    Text(
                      'Welcome to PostBird',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: 'Manrope',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Deliver your package nationwide \n without hesitation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.6),
                        fontFamily: 'Manrope',
                        fontSize: 17,
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
                        SizedBox(height: screenHeight * 0.03),
                        MyButton(
                          label: 'Register',
                          buttonColor: AppColors.whiteColor,
                          labelColor: AppColors.darkGrey,
                          hasBorder: true,
                          onTap: () {
                            Get.to(() => VerifyPhone());
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
