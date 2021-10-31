import 'package:postbird/core/index.dart';
import '../controllers/package_detail_controller.dart';

class NotDeliveredDetails extends StatelessWidget {
  NotDeliveredDetails({
    Key? key,
    required this.package,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<PackageDetailController>(
      init: PackageDetailController(package: package),
      builder: (controller) {
        return Stack(
          children: [
            AbsorbPointer(
              absorbing: false,
              child: GoogleMap(
                key: controller.mapKey,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                markers: controller.markers,
                polylines: controller.polylines,
                initialCameraPosition:
                    CameraPosition(target: controller.origin, zoom: 15),
                onMapCreated: (GoogleMapController _controller) {
                  // _controller.setMapStyle(controller.mapStyle);
                  controller.mapController = _controller;
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'We found courier to pick up \n your package.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: 'Manrope',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kosin Ken.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          AppColors.blackColor.withOpacity(0.6),
                                      fontFamily: 'Manrope',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Bike Courier',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.blackColor
                                          .withOpacity(0.35),
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                          ),
                          MyButton(
                            label: "Pick up",
                            buttonColor: AppColors.lightGreen,
                            width: 100,
                            height: 40,
                            onTap: () {},
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColors.whiteishColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deliver to',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: AppColors.blackColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    package.receiver.name,
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color:
                                          AppColors.blackColor.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '|',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  package.receiver.phone,
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color:
                                        AppColors.blackColor.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              package.destination.address!,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.blackColor.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              label: "Call",
                              hasBorder: true,
                              icon: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              labelColor: AppColors.blackColor,
                              buttonColor: Colors.transparent,
                              fontWeight: FontWeight.w600,
                              height: 45,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: MyButton(
                              label: "Chat",
                              icon: Icon(
                                Icons.chat,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              hasBorder: true,
                              labelColor: AppColors.blackColor,
                              buttonColor: Colors.transparent,
                              fontWeight: FontWeight.w600,
                              height: 45,
                              onTap: () => controller.navigateToChat(),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        );
      },
    );
  }
}
