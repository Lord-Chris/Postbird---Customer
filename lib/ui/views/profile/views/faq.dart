import 'package:postbird/core/index.dart';
import '../controllers/faq_controller.dart';

class Faq2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<FaqController>(
      init: FaqController(),
      builder: (controller) {
        return Material(
          color: AppColors.primaryColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                title: Center(
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      fontFamily: 'Manrope',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // actions: [
                //   IconButton(
                //       icon: Icon(
                //         Icons.edit,
                //         color: Colors.orange,
                //       ),
                //       onPressed: null)
                // ],
              ),
              body: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Text(
                      'Top Questions',
                      style: TextStyle(
                        color: Color.fromRGBO(27, 27, 27, 1),
                        fontFamily: 'Manrope',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: controller.topQuestions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (__, index) {
                      final faq = controller.topQuestions[index];
                      return ExpansionTile(
                        iconColor: AppColors.primaryColor,
                        title: Text(
                          faq.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Manrope',
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        children: [
                          Container(
                            width: width,
                            child: Text(
                              faq.body,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        leading: Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Text(
                      'Popular Topics',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: 'Manrope',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: controller.popularTopics.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (__, index) {
                      final faq = controller.popularTopics[index];
                      return ExpansionTile(
                        iconColor: AppColors.primaryColor,
                        title: Text(
                          faq.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Manrope',
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        children: [
                          Container(
                            width: width,
                            child: Text(
                              faq.body,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Text(
                      'Frequently asked Questions',
                      style: TextStyle(
                        color: Color.fromRGBO(27, 27, 27, 1),
                        fontFamily: 'Manrope',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: controller.frequentlyAsked.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (__, index) {
                      final faq = controller.frequentlyAsked[index];
                      return ExpansionTile(
                        iconColor: AppColors.primaryColor,
                        title: Text(
                          faq.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Manrope',
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        children: [
                          Container(
                            width: width,
                            child: Text(
                              faq.body,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                      );
                    },
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
