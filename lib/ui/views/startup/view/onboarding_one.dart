import 'package:postbird/core/index.dart';
import '../controller/startup_controller.dart';

class OnboardingOne extends StatelessWidget {
  OnboardingOne({Key? key}) : super(key: key);

  final List<OnboardingItem> items = [
    OnboardingItem(
      title: 'Create an account ',
      desc:
          'Create your quick account with\nPostBird and fill up package details ',
      image: 'assets/onboard 1.jpg',
    ),
    OnboardingItem(
      title: 'Pick up and drop off location',
      desc:
          'After completing the process, our\nlogistics experts pickup parcel from\nyour given address',
      image: 'assets/onboard 2.jpg',
    ),
    OnboardingItem(
      title: 'Pickup delivery',
      desc: 'Fast delivery to your home, office,\nwherever you are',
      image: 'assets/onboard 3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<StartupController>(
      init: StartupController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                PageView.builder(
                  controller: controller.pageController,
                  itemCount: items.length,
                  itemBuilder: (__, index) {
                    final item = items[controller.onboardIndex];
                    return Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      height: screenHeight,
                    );
                  },
                ),
                Container(
                  color: AppColors.blackColor.withOpacity(0.6),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              items[controller.onboardIndex].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              items[controller.onboardIndex].desc,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteColor,
                                fontSize: 20,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      SizedBox(
                        height: 10,
                        child: Center(
                          child: ListView.builder(
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (__, index) {
                              bool isIndex = index == controller.onboardIndex;
                              return Center(
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  height: 7,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  width: isIndex ? 40 : 15,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor
                                        .withOpacity(isIndex ? 1 : 0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                              label: "Continue",
                              onTap: () => controller.onContinueTap(),
                            ),
                            SizedBox(height: 20),
                            MyButton(
                              label: "Skip",
                              buttonColor: Colors.transparent,
                              hasBorder: true,
                              borderColor: AppColors.whiteColor,
                              onTap: () => controller.onSkipTap(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class OnboardingItem {
  final String title, desc, image;

  OnboardingItem(
      {required this.title, required this.desc, required this.image});
}
