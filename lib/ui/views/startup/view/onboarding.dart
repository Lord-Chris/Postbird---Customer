import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/auth/views/login.dart';

import '../controller/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
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
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Login());
                          },
                          child: Container(
                            width: screenWidth * 0.94,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackColor.withOpacity(0.2),
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                )
                              ],
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Manrope',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        MyButton(
                          label: 'Register',
                          buttonColor: AppColors.whiteColor,
                          labelColor: AppColors.darkGrey,
                          onTap: () {
                            print('Register');
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => CreateAccount2()));
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        GestureDetector(
                          onTap: () {
                            print('LAST...');
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => NavBar()));
                          },
                          child: Container(
                            width: screenWidth * 0.94,
                            height: screenHeight * 0.075,
                            decoration: BoxDecoration(
                              color: AppColors.mediumGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Continue with FingerPrint',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: 'Manrope',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
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
