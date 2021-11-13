import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import 'select_location.dart';
import 'top_up_credit.dart';
import 'track_package.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                              controller.user.credit! + '  Credits',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 18,
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
  const HomeListItem({
    Key? key,
    required this.package,
  }) : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      // onTap: () {
      //   if (package.packageStatus == PackageStatus.notAssigined)
      //     Get.to(() => SelectLocation(package: package));
      //   else
      //     Get.to(() => PackageDetailView(package: package));
      // },
      child: Container(
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
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  LinearProgressIndicator(
                    color: Color.fromRGBO(181, 176, 254, 0.87),
                    value: 0.5,
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
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'ETA 02:12 PM',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.manrope(
                          color: AppColors.blackColor.withOpacity(0.3),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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

            // Positioned(
            //   top: 44,
            //   left: 14,
            //   child: Container(
            //     width: 205,
            //     4,
            //     decoration: BoxDecoration(
            //       color: Color.fromRGBO(
            //           255, 255, 255, 1),
            //     ),
            //     child: Stack(
            //       children: <Widget>[
            //         Positioned(
            //             top: 5,
            //             left: 0,
            //             child: Container(
            //                 width: 205,
            //                 height: 6,
            //                 decoration:
            //                     BoxDecoration(
            //                   borderRadius:
            //                       BorderRadius.only(
            //                     topLeft:
            //                         Radius.circular(
            //                             2.5),
            //                     topRight:
            //                         Radius.circular(
            //                             2.5),
            //                     bottomLeft:
            //                         Radius.circular(
            //                             2.5),
            //                     bottomRight:
            //                         Radius.circular(
            //                             2.5),
            //                   ),
            //                   color: Color.fromRGBO(
            //                       255,
            //                       255,
            //                       255,
            //                       0.7599999904632568),
            //                 ))),
            //         Positioned(
            //             top: 5,
            //             left: 0,
            //             child: Container(
            //                 width: 100,
            //                 height: 6,
            //                 decoration:
            //                     BoxDecoration(
            //                   borderRadius:
            //                       BorderRadius.only(
            //                     topLeft:
            //                         Radius.circular(
            //                             2.5),
            //                     topRight:
            //                         Radius.circular(
            //                             2.5),
            //                     bottomLeft:
            //                         Radius.circular(
            //                             2.5),
            //                     bottomRight:
            //                         Radius.circular(
            //                             2.5),
            //                   ),
            //                   gradient: LinearGradient(
            //                       begin: Alignment(
            //                           -2.1872713565826416,
            //                           0),
            //                       end: Alignment(0,
            //                           -2.1872713565826416),
            //                       colors: [
            //                         Color.fromRGBO(
            //                             180,
            //                             176,
            //                             254,
            //                             0.6700000166893005),
            //                         Color.fromRGBO(
            //                             152,
            //                             147,
            //                             244,
            //                             0.6700000166893005)
            //                       ]),
            //                 ))),
            //         Positioned(
            //           top: 0,
            //           left: 93,
            //           child: Container(
            //               width: 14,
            //               4,
            //               decoration: BoxDecoration(
            //                 color: Color.fromRGBO(
            //                     255, 255, 255, 1),
            //               ),
            //               child: Stack(
            //                   children: <Widget>[
            //                     Positioned(
            //                         top:
            //                             1.3378305435180664,
            //                         left:
            //                             0.679410457611084,
            //                         child: Image(
            //                           width: 15,
            //                           3,
            //                           image:
            //                               AssetImage(
            //                             'assets/Path.png',
            //                           ),
            //                         )),
            //                   ])),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
