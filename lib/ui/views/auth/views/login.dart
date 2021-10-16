import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

import '../controllers/login_controller.dart';

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
                          height: 100,
                        ),
                        Text(
                          'Welcome Back',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'manrope',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
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
                        TextFormField(
                          controller: controller.emailController,
                          validator: (e) => validateEmail(e),
                          keyboardType: TextInputType.name,
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(
                                  0xFFDEDEDE,
                                ),
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: 'manrope',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
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
                        TextFormField(
                          controller: controller.passwordController,
                          validator: validatePassword,
                          obscureText: controller.obsureText,
                          keyboardType: TextInputType.name,
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () => controller.toggleObscurity(),
                              child: Icon(
                                controller.obsureText
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.darkGrey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(
                                  0xFFDEDEDE,
                                ),
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: 'manrope',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        GestureDetector(
                          onTap: () {
                            if (!_key.currentState!.validate()) return;
                            FocusScope.of(context).unfocus();
                            controller.onLoginTap();
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
                              child: Visibility(
                                visible: !controller.isBusy,
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Manrope',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                                replacement: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'manrope',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(
                                  0xFFFEBC52,
                                ),
                              ),
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
