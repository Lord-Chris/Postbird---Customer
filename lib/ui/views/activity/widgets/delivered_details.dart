import 'package:postbird/core/index.dart';
import '../controllers/package_detail_controller.dart';

class DeliveredDetails extends StatelessWidget {
  const DeliveredDetails({
    Key? key,
    required this.package,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<PackageDetailController>(
      init: PackageDetailController(package: package),
      builder: (controller) {
        return Material(
          color: Colors.green[700],
          child: Container(
            width: screenWidth,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.35,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Positioned(
                              top: screenHeight * 0.05,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 110,
                                  backgroundColor:
                                      AppColors.whiteColor.withOpacity(0.3),
                                ),
                              ),
                            ),
                            Positioned(
                              top: screenHeight * 0.09,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundColor:
                                      AppColors.whiteColor.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Positioned(
                              top: screenHeight * 0.13,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: AppColors.whiteColor,
                                  child: Image(
                                    image: AssetImage('assets/tick.png'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15.0,
                              left: 10.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.primaryColor,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          'Delivered ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          'Your order has arrived at its destination',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        controller.isBusy && controller.package.courier == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        controller.package.courier!.photo),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.package.courier!.name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.blackColor
                                                  .withOpacity(0.6),
                                              fontFamily: 'Manrope',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Courier',
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
                                  InkWell(
                                    onTap: () => controller.onCallTap(),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.primaryColor,
                                      child: Icon(
                                        Icons.call_outlined,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.primaryColor,
                                      child: Icon(
                                        Icons.chat_outlined,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        DeliveredLocWidget(
                          image: 'assets/Path.png',
                          name: package.sender.name,
                          phone: package.sender.phone,
                          address: package.sender.address,
                        ),
                        DeliveredLocWidget(
                          image: 'assets/ReceipentMarker.png',
                          name: package.receiver.name,
                          phone: package.receiver.phone,
                          address: package.receiver.address,
                        ),
                        const SizedBox(height: 10),
                        MyButton(
                          label: "Back To Home",
                          height: 45,
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

class DeliveredLocWidget extends StatelessWidget {
  const DeliveredLocWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.phone,
    required this.address,
  }) : super(key: key);

  final String image, name, phone, address;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15),
      // height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.whiteishColor,
        ),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
            width: screenWidth * 0.05,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        name,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.blackColor.withOpacity(0.7),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '|',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: AppColors.blackColor.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      phone,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.blackColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  address,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.blackColor.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
