import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import 'package:postbird/ui/views/profile/views/notifications.dart';
import 'select_location.dart';
import 'top_up_credit.dart';
import 'track_package.dart';
import '../controllers/home_controller.dart';
import '../widgets/notification_icon.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(DateTime(2022, 04, 1).millisecondsSinceEpoch);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: screenHeight * 0.15,
                      child: Image(
                        image: AssetImage('assets/Group.png'),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Expanded(
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: _buildBottomBody(controller),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: NotificationIcon(
                    list: controller.notifications,
                    onPressed: () async {
                      await Get.to(() => Notifications());
                      controller.update();
                    },
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  left: 30,
                  right: 30,
                  child: Container(
                    height: screenHeight * 0.14,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(2.0, 5.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => TopUpCredit());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.beenhere,
                                    color: Colors.orangeAccent,
                                  ),
                                  Text(
                                    ' TopUp Credit',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Manrope',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              controller.user.parseBalance!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          child: TextButton.icon(
                            onPressed: () => Get.to(() => TrackPackage()),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orangeAccent,
                              size: 20,
                            ),
                            label: Text(
                              'Track Order',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
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
        );
      },
    );
  }

  Widget _buildBottomBody(HomeController controller) {
    return Builder(
      builder: (context) {
        var screenWidth = MediaQuery.of(context).size.width;
        var screenHeight = MediaQuery.of(context).size.height;
        return Visibility(
          visible: controller.isBusy && controller.activities.isEmpty,
          child: Center(child: CircularProgressIndicator()),
          replacement: RefreshIndicator(
            onRefresh: () => controller.fetchActivities(),
            child: ListView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                controller.activities.isEmpty
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                            height: 240,
                            width: 240,
                            image: AssetImage(
                              'assets/Rectangle.png',
                            ),
                          ),
                          Text(
                            'No package',
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Text(
                            'Create an order ?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: controller.activities.length > 5
                            ? 5
                            : controller.activities.length,
                        shrinkWrap: true,
                        itemBuilder: (__, index) {
                          final _package = controller.activities[index];
                          return HomeListItem(package: _package);
                        },
                      ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: MyButton(
                    label: 'Send a Package',
                    width: 270,
                    height: 48,
                    onTap: () {
                      Get.to(() => SelectLocation());
                    },
                  ),
                ),
                Visibility(
                  visible: controller.activities.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      "assets/Banner.png",
                      width: screenWidth,
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

class HomeListItem extends StatelessWidget {
  HomeListItem({
    Key? key,
    required this.package,
  }) : super(key: key);
  final Package package;

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: screenWidth * 0.96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            offset: Offset(0, 18),
            blurRadius: 40,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PostBird is delivering your package',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.manrope(
                    color: AppColors.blackColor.withOpacity(0.6),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                FutureBuilder<double>(
                  future: controller.getDeliveryProgress(package),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    return Column(
                      children: [
                        LinearProgressIndicator(
                          color: Color.fromRGBO(181, 176, 254, 0.87),
                          value: snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? null
                              : snapshot.data,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              package.receiver.name,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.manrope(
                                color: AppColors.blackColor.withOpacity(0.3),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Visibility(
                              visible: snapshot.connectionState !=
                                  ConnectionState.waiting,
                              child: Text(
                                snapshot.data == 0.01
                                    ? "awaiting a courier"
                                    : "${package.courier?.duration} left",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                  color: AppColors.blackColor.withOpacity(0.3),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          MyButton(
            label: "Track",
            labelColor: AppColors.primaryColor,
            buttonColor: AppColors.whiteColor,
            borderColor: AppColors.primaryColor,
            borderRadius: 10,
            hasBorder: true,
            height: 40,
            width: 80,
            onTap: () {
              if (package.packageStatus == PackageStatus.notAssigined)
                Get.to(() => SelectLocation(package: package));
              else
                Get.to(() => PackageDetailView(package: package));
            },
          ),
        ],
      ),
    );
  }
}
