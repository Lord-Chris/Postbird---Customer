import 'package:postbird/core/index.dart';

import '../controllers/security_controller.dart';

class Security extends StatelessWidget {
  Security({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<SecurityController>(
      init: SecurityController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: 15,
                    width: width - 70,
                    decoration: BoxDecoration(
                      color: AppColors.whiteishColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(1000),
                        topLeft: Radius.circular(1000),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height:
                        height - 40 - MediaQuery.of(context).viewPadding.top,
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                              Text(
                                'Security',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (!_formKey.currentState!.validate())
                                    return;
                                  controller.updatePassword();
                                },
                                child: Text(
                                  'Save',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.mediumGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !controller.isBusy,
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: AppColors.iconGrey,
                          ),
                          replacement: LinearProgressIndicator(
                            color: AppColors.primaryColor,
                            backgroundColor: AppColors.iconGrey,
                            minHeight: 5,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                              padding: EdgeInsets.only(top: 5, left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Password',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(
                                    controller: controller.currentPassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: controller.obsureText,
                                    suffixIcon: GestureDetector(
                                      onTap: () => controller.toggleObscurity(),
                                      child: Icon(
                                        controller.obsureText
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.mediumGrey,
                                      ),
                                    ),
                                    hint: 'Current Password',
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'New Password',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(
                                    controller: controller.newPassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: controller.obsureText,
                                    suffixIcon: GestureDetector(
                                      onTap: () => controller.toggleObscurity(),
                                      child: Icon(
                                        controller.obsureText
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.mediumGrey,
                                      ),
                                    ),
                                    hint: 'New Password',
                                    validator: controller.validatePassword,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Confirm Password',
                                    style: GoogleFonts.manrope(
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
                                    controller: controller.confirmPassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: controller.obsureText,
                                    suffixIcon: GestureDetector(
                                      onTap: () => controller.toggleObscurity(),
                                      child: Icon(
                                        controller.obsureText
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.mediumGrey,
                                      ),
                                    ),
                                    hint: 'Confirm Password',
                                    validator: (val) =>
                                        controller.validateConfirmPassword(
                                            val, controller.newPassword.text),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
