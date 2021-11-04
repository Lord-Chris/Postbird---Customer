import 'package:postbird/core/index.dart';
import '../controllers/notifications_controller.dart';
import '../widgets/notification_container.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
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
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
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
                                'Notifications',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Container(),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: AppColors.iconGrey,
                        ),
                        Expanded(
                          child: FutureBuilder<List<NotificationItem>>(
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
                                    "You do not have notifications",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                );
                              }
                              final _order = snapshot.data!
                                  .where((e) =>
                                      e.category == NotificationCategory.Order)
                                  .toList();
                              final _personal = snapshot.data!
                                  .where((e) =>
                                      e.category != NotificationCategory.Order)
                                  .toList();
                              return Column(
                                children: [
                                  Visibility(
                                    visible: _order.isNotEmpty,
                                    child: Column(
                                      children: [
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
                                        ListView.builder(
                                          shrinkWrap: true,
                                          controller: controller.scrollCont,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (__, index) {
                                            final notification = _order[index];
                                            return NotificationContainer(
                                              notification: notification,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _personal.isNotEmpty,
                                    child: Column(
                                      children: [
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
                                        ListView.builder(
                                          shrinkWrap: true,
                                          controller: controller.scrollCont,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (__, index) {
                                            final notification =
                                                _personal[index];
                                            return NotificationContainer(
                                              notification: notification,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
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
      },
    );
  }
}

