import 'package:postbird/core/index.dart';
import '../controllers/top_up_credit_controller.dart';

class PaymentPlan extends StatelessWidget {
  const PaymentPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return GetBuilder<TopUpCreditController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),
                Text(
                  "Choose a plan",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "Flexible credits plan and pricings allows you to easily top-up your account",
                  style: TextStyle(
                    color: AppColors.blackColor.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.4,
                  child: ListView.builder(
                    itemCount: controller.paymentPlans.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (__, index) {
                      PayPlan plan = controller.paymentPlans[index];
                      return InkWell(
                        onTap: () => controller.changeChoseIndex(index),
                        child: controller.chosenIndex == index
                            ? SelectedPlan(plan: plan)
                            : UnSelectedPlan(plan: plan),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Enter Other Amount",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "Amount",
                  controller: controller.amountCont,
                  keyboardType: TextInputType.number,
                  onChanged: controller.onTextFieldChanged,
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: MyButton(
                    label: "Pay",
                    onTap: () => controller.onPayTap(),
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

class SelectedPlan extends StatelessWidget {
  final PayPlan plan;
  const SelectedPlan({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.5,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(252, 155, 0, 1),
            Color.fromRGBO(254, 188, 82, 0.39),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${plan.title} of Credits",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            "${plan.credit} Credits",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: height * 0.03),
          Image.asset(plan.image),
          SizedBox(height: height * 0.03),
          MyButton(
            label: "N ${plan.price}",
            labelColor: AppColors.whiteColor,
            fontWeight: FontWeight.normal,
            buttonColor: Color.fromRGBO(58, 27, 4, 0.63),
            height: height * 0.05,
            width: width * 0.3,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}

class UnSelectedPlan extends StatelessWidget {
  final PayPlan plan;
  const UnSelectedPlan({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        // height: height * 0.3,
        width: width * 0.4,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.03,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${plan.title} of Credits",
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              "${plan.credit} Credits",
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.03),
            Image.asset(plan.image),
            SizedBox(height: height * 0.03),
            MyButton(
              label: "N ${plan.price}",
              fontWeight: FontWeight.normal,
              height: height * 0.05,
              width: width * 0.3,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
