import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

import '../controllers/create_package_controller.dart';
import '../widgets/recipient.dart';
import '../widgets/review_order.dart';
import '../widgets/shipment.dart';

class CreatePackage extends StatelessWidget {
  final PackageLocation origin, destination;
  final DateTime date;
  const CreatePackage(
      {Key? key,
      required this.origin,
      required this.destination,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<CreatePackageController>(
      init: CreatePackageController(origin, destination, date),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: WillPopScope(
            onWillPop: () async => controller.back(),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace_sharp,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () => controller.back(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Create Order',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              color: AppColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.09),
                            offset: Offset(0, 18),
                            blurRadius: 40,
                          )
                        ],
                        color: AppColors.whiteColor,
                      ),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Container(
                            width: screenWidth,
                            color: AppColors.whiteColor,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 45,
                                  right: 45,
                                  top: 7,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Divider(
                                            thickness: 2,
                                            color: 1 <= controller.pageIndex
                                                ? AppColors.primaryColor
                                                : AppColors.iconGrey,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Divider(
                                            thickness: 2,
                                            color: 2 <= controller.pageIndex
                                                ? AppColors.primaryColor
                                                : AppColors.iconGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CreatePackageIndicator(
                                      label: 'Shipment Form',
                                      index: 0,
                                      currentIndex: controller.pageIndex,
                                    ),
                                    Spacer(),
                                    CreatePackageIndicator(
                                      label: 'Recipient Form',
                                      index: 1,
                                      currentIndex: controller.pageIndex,
                                    ),
                                    Spacer(),
                                    CreatePackageIndicator(
                                      label: 'Review Order',
                                      index: 2,
                                      currentIndex: controller.pageIndex,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Form(
                              key: controller.formKey,
                              child: PageView(
                                controller: controller.pageController,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Shipment(),
                                  Recipient(),
                                  ReviewOrder(),
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
