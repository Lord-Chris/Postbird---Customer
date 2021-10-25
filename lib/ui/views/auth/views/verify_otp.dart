import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:postbird/core/index.dart';
import '../controllers/signup_controller.dart';

class VerifyOtp extends StatelessWidget {
  VerifyOtp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      autoRemove: false,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            title: Text(
              'Login',
              style: TextStyle(
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
            child: ListView(
              children: [
                SizedBox(height: 60),
                Text(
                  'Please enter 6-digit code that sent you at',
                  style: TextStyle(
                    fontFamily: 'manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xFF464646,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '${controller.phone}',
                  style: TextStyle(
                    fontFamily: 'manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(
                      0xFF464646,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        length: 6,
                        appContext: context,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        validator: controller.validateOtp,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          selectedFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: Colors.grey,
                          activeColor: Colors.black,
                          activeFillColor:
                              AppColors.primaryColor, // : Colors.transparent,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        controller: controller.otp,
                        onCompleted: (val) {
                          print("Completed");
                          controller.onVerifyOtp();
                        },
                        onChanged: (value) {
                          print(value);
                          // setState(() {
                          //   currentText = value;
                          // });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      if (controller.remainingTime == 0)
                        controller.onVerifyPhone(false);
                    },
                    child: Text(
                      controller.remainingTime == 0
                          ? 'RESEND'
                          : 'Resend code in ${controller.remainingTime}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'manrope',
                          color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                          fontSize: 12,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                SizedBox(
                  height: 200,
                ),
                GestureDetector(
                  onTap: () {
                    if (!_formKey.currentState!.validate()) return;
                    controller.onVerifyOtp();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(
                        0xFFFEBC52,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'manrope',
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
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
