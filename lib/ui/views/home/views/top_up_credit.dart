import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import '../controllers/top_up_credit_controller.dart';
import '../widgets/payment_plan.dart';
import '../widgets/payment_tab.dart';

class TopUpCredit extends StatelessWidget {
  const TopUpCredit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopUpCreditController>(
      init: TopUpCreditController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: WillPopScope(
            onWillPop: () async => controller.back(),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 30, bottom: 20),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'Buy Credit',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 10,
                          child: GestureDetector(
                            onTap: () => controller.back(),
                            child: Icon(
                              Icons.keyboard_backspace,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.791,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          AbsorbPointer(
                            child: TabBar(
                              onTap: null,
                              controller: controller.tabCont,
                              tabs: [
                                Tab(
                                  child: TabWidget(
                                    icon: controller.tabCont.index == 0
                                        ? "1"
                                        : Icon(
                                            Icons.done,
                                            size: 12,
                                            color: AppColors.whiteColor,
                                          ),
                                    text: "Choose a payment plan",
                                    isSelected: true,
                                  ),
                                ),
                                Tab(
                                  child: TabWidget(
                                    icon: "2",
                                    text: "Payment",
                                    isSelected: controller.tabCont.index == 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: controller.tabCont,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                PaymentPlan(),
                                Payment(),
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
          ),
        );
      },
    );
  }
}

class TabWidget extends StatelessWidget {
  TabWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);
  final dynamic icon;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: icon is String
              ? Text(
                  icon,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                )
              : icon,
          backgroundColor: AppColors.primaryColor,
          radius: 10,
        ),
        SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.primaryColor : AppColors.mediumGrey,
          ),
        ),
      ],
    );
  }
}
