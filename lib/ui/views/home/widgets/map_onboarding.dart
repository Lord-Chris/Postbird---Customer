import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/home/controllers/select_location_controller.dart';

class MapOnboarding extends StatelessWidget {
  MapOnboarding({Key? key}) : super(key: key);
  final List<MapOnboardDetails> details = [
    MapOnboardDetails(
      title: 'Start by placing your order here.',
      desc:
          'We believe that a connected world is a better world, and that belief guides.',
    ),
    MapOnboardDetails(
      title: "Select a date",
      desc: "Pick a date you want your package to be picked up.",
    ),
    MapOnboardDetails(
      title: "Enter Pickup Address",
      desc: "Enter the address where you want your package to be picked up.",
    ),
    MapOnboardDetails(
      title: "Enter Destination Address",
      desc:
          "Enter the destination where you want your package to be Delivered.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<SelectLocationController>(
      id: "map-onboard",
      builder: (controller) {
        return Container(
          color: AppColors.blackColor.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.onboardIndex + 1}/4',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      details[controller.onboardIndex].title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Manrope',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      details[controller.onboardIndex].desc,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[600],
                        letterSpacing: 1,
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => controller.endOnboarding(),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: 'Manrope',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => controller.nextOnboarding(),
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              fixedSize: Size(100, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Manrope',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(fontSize: 12),
                      cursorColor: AppColors.primaryColor,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: "Select Date",
                        icon: Image.asset(
                          'assets/clock.png',
                          height: height * 0.035,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 15,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 12),
                      cursorColor: AppColors.primaryColor,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: "Pickup Location",
                        icon: Image.asset(
                          'assets/Path.png',
                          height: height * 0.035,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 15,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 12),
                      cursorColor: AppColors.primaryColor,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: "Destination To",
                        icon: Image.asset(
                          'assets/roundgreen.png',
                          height: height * 0.035,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 15,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MapOnboardDetails {
  final String title, desc;

  MapOnboardDetails({required this.title, required this.desc});
}
