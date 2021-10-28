import 'package:postbird/core/index.dart';
import '../controllers/select_location_controller.dart';

class CourierSearch extends StatelessWidget {
  const CourierSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GetBuilder<SelectLocationController>(
        id: "Courier Search",
        builder: (controller) {
          return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: controller.showCourierSearchBox,
              child: Container(
                height: height * 0.4,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wait, while we find a courier for you',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          GetBuilder<SelectLocationController>(
                              id: "countdown",
                              builder: (controller) {
                                return Text(
                                  "${controller.searchCount}s",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              width: 102.00020599365234,
                              height: 91.00017547607422,
                              child: Image(
                                image: AssetImage(controller.findingCourier
                                    ? 'assets/anim.gif'
                                    : 'assets/anim.png'),
                              ),
                            ),
                            Text(
                              'Finding Courier',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Color.fromRGBO(0, 0, 0, 0.8999999761581421),
                                fontFamily: 'Manrope',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.009),
                            Text(
                              'A  Courier will pick up your package soon.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const Spacer(),
                            MyButton(
                                label: controller.findingCourier
                                    ? "Cancel"
                                    : "Try Again",
                                labelColor: AppColors.blackColor,
                                buttonColor: AppColors.whiteColor,
                                hasBorder: true,
                                width: width * 0.7,
                                onTap: () =>
                                    controller.onCourierSearchButtonTap()),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
