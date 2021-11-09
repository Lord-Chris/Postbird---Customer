import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

import '../controllers/signup_controller.dart';

class VerifyPhone extends StatelessWidget {
  VerifyPhone({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
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
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Enter Your Phone Number',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'We believe that a connected world is a better world, and that belief guides.',
                    style: TextStyle(
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  InternationalPhoneNumberInput(
                    cursorColor: AppColors.primaryColor,
                    formatInput: true,
                    keyboardType: TextInputType.phone,
                    initialValue: PhoneNumber(dialCode: '234'),
                    locale: "NG",
                    textFieldController: controller.phoneController,
                    validator: controller.validatePhoneNumber,
                    onInputChanged: (PhoneNumber value) async {
                      print(controller.phone);
                      controller.phone = value.phoneNumber!;
                      print(controller.phone);
                    },
                    inputDecoration:
                        decoration().copyWith(hintText: 'Phone Number'),
                    selectorConfig: SelectorConfig(
                      showFlags: true,
                      useEmoji: true,
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                  ),
                  SizedBox(height: 250),
                  Text(
                    'By clicking ‘Continue’, you have read and agree with our ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'manrope',
                      color: AppColors.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 3),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontFamily: 'manrope',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: 'Conditions',
                            style: TextStyle(
                              fontFamily: 'manrope',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    label: "Continue",
                    isBusy: controller.isBusy,
                    onTap: () {
                      if (!_formKey.currentState!.validate()) return;
                      controller.onVerifyPhone();
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
