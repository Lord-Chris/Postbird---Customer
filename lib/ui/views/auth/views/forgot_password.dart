import 'package:postbird/core/index.dart';
import '../controllers/login_controller.dart';

class ForgotPassword extends StatelessWidget with Validator {
  ForgotPassword({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<LoginController>(
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
                          'Forgot Password',
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
                        MyTextField(
                          controller: controller.forgotPasswordCont,
                          validator: (e) => validateEmail(e),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 50),
                        MyButton(
                          label: 'Continue',
                          hasShadow: true,
                          isBusy: controller.isBusy,
                          onTap: () {
                            if (!_key.currentState!.validate()) return;
                            controller.resetPassword();
                          },
                        ),
                      ],
                    ),
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
