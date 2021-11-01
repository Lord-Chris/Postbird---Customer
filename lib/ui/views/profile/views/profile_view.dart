import 'package:postbird/ui/views/profile/views/faq.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

import '../controllers/profile_controller.dart';
import 'edit_profile.dart';
import 'security.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 30, bottom: 20),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'Account',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          child: GestureDetector(
                            onTap: () {
                              controller.signOut();
                            },
                            child: Text(
                              'Logout',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.791,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    '${Constants.PHOTOS_BASEURL}${controller.user.profilePic}',
                                    height: height / 12,
                                    width: height / 12,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        right: 16, left: 16, top: 5, bottom: 5),
                                    height: height / 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.user.fullName,
                                            style: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Get.to(EditProfile()),
                                            child: Text(
                                              'Edit Profile',
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height / 6,
                                  width: width / 2.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color:
                                          AppColors.iconGrey.withOpacity(0.5),
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.sentPackages.toString(),
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                          color: AppColors.mediumGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Sent Packages',
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: AppColors.mediumGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height / 6,
                                  width: width / 2.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color:
                                          AppColors.iconGrey.withOpacity(0.5),
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4,212',
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                          color: AppColors.mediumGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Points',
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: AppColors.mediumGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => EditProfile()),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 20, left: 20, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          height: 25,
                                          width: 25,
                                          image: AssetImage(
                                            'assets/Icon.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text(
                                          'Account Settings',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 20),
                            child: Container(
                              height: 1,
                              width: width / 1.25,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => Security());
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 20, left: 20, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          height: 25,
                                          width: 25,
                                          image: AssetImage(
                                            'assets/Icon.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text(
                                          'Security',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 20),
                            child: Container(
                              height: 1,
                              width: width / 1.25,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 20, left: 20, top: 20),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Notifications()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          height: 25,
                                          width: 25,
                                          image: AssetImage(
                                            'assets/Icon.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text(
                                          'Notification',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 20),
                            child: Container(
                              height: 1,
                              width: width / 1.25,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 20, left: 20, top: 20),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => Faq2());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          height: 25,
                                          width: 25,
                                          image: AssetImage(
                                            'assets/Icon.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text(
                                          'Help & FAQ',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 20),
                            child: Container(
                              height: 1,
                              width: width / 1.25,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
