import 'package:postbird/ui/views/activity/widgets/complete_view.dart';
import 'package:postbird/ui/views/activity/widgets/progress_view.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivityController>(
      init: ActivityController(),
      builder: (controller) {
        var screenWidth = MediaQuery.of(context).size.width;
        var screenHeight = MediaQuery.of(context).size.height;
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: Text(
                      'My Activity',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    // height: screenHeight,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: controller.tabController,
                          isScrollable: false,
                          onTap: controller.updateIndex,
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: AppColors.mediumGrey,
                          labelStyle: GoogleFonts.manrope(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                          unselectedLabelStyle: GoogleFonts.manrope(
                            color: AppColors.mediumGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide.none),
                          tabs: [
                            Tab(text: 'In Progress'),
                            Tab(text: 'Complete'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              Visibility(
                                visible: controller.isBusy &&
                                    controller.activities.isEmpty,
                                replacement: InProgressActivityTwo(),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.isBusy &&
                                    controller.activities.isEmpty,
                                replacement: CompleteActivity(),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
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
