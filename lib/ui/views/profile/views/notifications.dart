import 'package:postbird/core/index.dart';
import '../controllers/notifications_controller.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: SafeArea(
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
                                Container(),
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
                          ListTile(
                            title: Text(
                              'Order',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          FutureBuilder<List>(
                            future: controller.fetchNotifications(),
                            builder: (__, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if ((snapshot.data == null ||
                                  snapshot.data!.isEmpty)) {
                                return Center(
                                  child: Text(
                                    "No available chats. Create a package to chat",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                color: Color(0xFFFAF7F2),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                width: double.infinity,
                                height: 100,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Your package is ready to pickup',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        Text(
                                          'New',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 10,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Order BX-71720 is already to pickup on 5:20 PM, Hi Kitani, please prepare your package thank you!',
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              'For You',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppColors.blackColor,
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