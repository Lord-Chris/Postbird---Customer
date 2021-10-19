import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
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
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.close,
                                  ),
                                ),
                                Text(
                                  'Edit Profile',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (!_formKey.currentState!.validate())
                                      return;
                                    controller.updateProfile();
                                  },
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.grey[700],
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 90.0,
                                          width: 90.0,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://api.postbird.com.ng/public/img/profile/default.png',
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          width: 150,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                              color: Color(
                                                0xFFDEDEDE,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.camera_alt_outlined,
                                                color: AppColors.darkGrey,
                                              ),
                                              Text(
                                                'Upload Photo',
                                                style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: AppColors.darkGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                    padding: EdgeInsets.only(top: 5, left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.darkGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyTextField(
                                          controller: controller.name,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          keyboardType: TextInputType.text,
                                          hint: 'Full Name',
                                          validator:
                                              controller.validateFullName,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Email',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.darkGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyTextField(
                                          controller: controller.email,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          hint: 'email@mail.com',
                                          validator: controller.validateEmail,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Phone Number',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.darkGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyTextField(
                                          controller: controller.phone,
                                          keyboardType: TextInputType.phone,
                                          hint: '56789',
                                          validator:
                                              controller.validatePhoneNumber,
                                          readOnly: true,
                                          // prefix: Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Text(
                                          //       '+234  ',
                                          //       style: GoogleFonts.manrope(
                                          //         fontSize: 16,
                                          //         fontWeight: FontWeight.w400,
                                          //         color: Colors.grey[700],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Address',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.darkGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyTextField(
                                          controller: controller.address,
                                          keyboardType: TextInputType.text,
                                          hint:
                                              '4270  Benson Park Drive. YOUNG AMERI',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
