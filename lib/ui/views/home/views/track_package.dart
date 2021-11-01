import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import '../controllers/home_controller.dart';

class TrackPackage extends StatelessWidget {
  const TrackPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: height / 1.085,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(top: 20),
                margin: const EdgeInsets.only(top: 40),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                              ),
                            ),
                            Text(
                              'Track Package',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Color(0xFFE7E7E7),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                        child: Image(
                          image: AssetImage(
                            'assets/search.png',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Input Package I.D',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                child: MyTextField(
                                  controller: controller.packageCont,
                                  keyboardType: TextInputType.text,
                                  hint: 'ex. BXI-2314312',
                                  validator: controller.validateNotEmpty,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Example BX-567829AD',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.mediumGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                        child: MyButton(
                          height: 60,
                          width: double.infinity,
                          label: 'Track Package',
                          isBusy: controller.isBusy,
                          onTap: () => controller.trackPackage(),
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
    });
  }
}
