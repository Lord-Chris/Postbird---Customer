import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import 'package:postbird/ui/views/auth/controllers/signup_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      autoRemove: false,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(
            0xFFFFFFFF,
          ),
          appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            title: Text(
              'Create Account',
              style: TextStyle(
                fontFamily: 'manrope',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: AppColors.whiteColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Enter information below to get started',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Full Name',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: controller.name,
                    keyboardType: TextInputType.name,
                    hint: 'Full Name',
                    validator: controller.validateFullName,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: controller.username,
                    keyboardType: TextInputType.name,
                    hint: 'Username',
                    validator: controller.validateNotEmpty,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    hint: 'Email',
                    validator: controller.validateEmail,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    hint: '*********',
                    validator: controller.validatePassword,
                    obscureText: controller.obscureText,
                    maxLines: 1,
                    suffix: GestureDetector(
                      onTap: () => controller.toggleObscurity(),
                      child: Icon(
                        controller.obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: controller.confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    hint: '*********',
                    validator: (val) => controller.validateConfirmPassword(
                        val, controller.password.text),
                    obscureText: controller.obscureText,
                    maxLines: 1,
                    suffix: GestureDetector(
                      onTap: () => controller.toggleObscurity(),
                      child: Icon(
                        controller.obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  MyButton(
                    label: "Next",
                    isBusy: controller.isBusy,
                    onTap: () {
                      if (!_formKey.currentState!.validate()) return;
                      controller.onSignUpTap();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
