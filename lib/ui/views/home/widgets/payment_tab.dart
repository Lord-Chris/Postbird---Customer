import 'package:postbird/core/index.dart';
import '../controllers/top_up_credit_controller.dart';

class Payment extends StatelessWidget {
  const Payment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<TopUpCreditController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "0121545788",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "ACCOUNT NUMBER",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Text(
                          "PostBird Logistics",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "ACCOUNT NAME",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Guaranty Trust Bank",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "BANK",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: () => controller.getReceiptImage(),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(
                          controller.receiptImage == null ? 30 : 0),
                      decoration: BoxDecoration(
                        color: AppColors.whiteishColor,
                        border: Border.all(
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                      ),
                      child: controller.receiptImage == null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Receipt Upload",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: AppColors.blackColor.withOpacity(0.3),
                                  size: 40,
                                ),
                                SizedBox(height: height * 0.03),
                                Text(
                                  "Browse your files",
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                              ],
                            )
                          : FittedBox(
                              fit: BoxFit.contain,
                              child: Image.file(
                                controller.receiptImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Center(
                child: MyButton(
                  label: "Submit",
                  isBusy: controller.isBusy,
                  onTap: () => controller.onSubmitTap(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}