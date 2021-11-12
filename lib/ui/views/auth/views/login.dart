import 'package:flutter/gestures.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

import '../controllers/login_controller.dart';
import 'forgot_password.dart';
import 'verify_phone.dart';

enum LoginStatus { notSignIn, signIn }

class Login extends StatelessWidget with Validator {
  final _key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: ListView(
              children: [
                Form(
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Welcome Back!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'manrope',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sign in with your email to use your account',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'manrope',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          controller: controller.emailController,
                          validator: (e) => validateEmail(e),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(
                              0xFF1B1B1B,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          controller: controller.passwordController,
                          validator: validatePassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.obsureText,
                          maxLines: 1,
                          suffix: GestureDetector(
                            onTap: () => controller.toggleObscurity(),
                            child: Icon(
                              controller.obsureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.mediumGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: MyButton(
                            onTap: () {
                              if (!_key.currentState!.validate()) return;
                              FocusScope.of(context).unfocus();
                              controller.onLoginTap();
                            },
                            label: 'Login',
                            isBusy: controller.isBusy,
                            hasShadow: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'manrope',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Visibility(
                          visible: controller.showFingerPrintButton,
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.fingerprint),
                              iconSize: screenWidth * 0.15,
                              onPressed: () => controller.fingerprintSignIn(),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.13),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.off(() => VerifyPhone());
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
