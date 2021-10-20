import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import 'package:postbird/ui/views/home/views/select_location.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: screenHeight * 0.15,
                      child: Image(
                        image: AssetImage('assets/Group.png'),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Expanded(
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.1,
                            ),
                            Image(
                                height: 240,
                                width: 240,
                                image: AssetImage(
                                  'assets/Rectangle.png',
                                )),
                            Text(
                              'No Activity',
                              style: GoogleFonts.manrope(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Text(
                              'Create an order ?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MyButton(
                              label: 'Send a Package',
                              width: 240,
                              height: 48,
                              onTap: () {
                                Get.to(() => SelectLocation());
                              },
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          107, 103, 210, 0.3499999940395355),
                                      offset: Offset(0, 18),
                                      blurRadius: 40)
                                ],
                              ),
                              child: Text(
                                'Send a Package',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Manrope',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  left: 30,
                  right: 30,
                  child: Container(
                    height: screenHeight * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(2.0, 5.0),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Row(),
                        Positioned(
                          top: screenHeight * 0.03,
                          left: screenWidth * 0.06,
                          child: GestureDetector(
                            onTap: () {
                              // _modalBottomSheetMenu();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.beenhere,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  ' TopUp Credit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Manrope',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.09,
                          left: screenWidth * 0.06,
                          child: Text(
                            controller.user.credit! + '  Credits',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Manrope',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.04,
                          right: screenWidth * 0.1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              border: Border.all(
                                color: Colors.black38,
                                width: 1,
                              ),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.orangeAccent,
                                size: 20,
                              ),
                              label: Text(
                                'Track Order',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Manrope',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
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
        );
      },
    );
  }
}
