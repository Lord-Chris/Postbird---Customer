import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import '../controllers/activity_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InProgressActivityTwo extends StatelessWidget {
  // fetchActivity() async{
  //   // print("ongoing");
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     setState(() {
  //       id = preferences.getString("id")!;
  //     });
  //     print('ID: ' + id);

  //     var surl = Strings.SECBASE_URL;
  //     var surl2 = surl + id;
  //     print(surl2);
  //     print(id);

  //     final response = await http.get(Uri.parse(surl2));

  //     final dat = jsonDecode(response.body);

  //     if(dat['success'] == "true"){
  //       var data = dat['data'];
  //       var arr = [];
  //       for (var i=0; i<data.length; i++){
  //         if(data[i]['status'] == "0"){
  //           arr.add(data[i]);
  //         }
  //       }
  //       //  print(data);
  //       setState(() {
  //         activites = arr;
  //       });
  //     }
  //     print("new activities");
  //     print(activites);
  // }

  final controller = Get.find<ActivityController>();
  Widget build(BuildContext context) {
    final activities = controller.activities.where((e) => !e.isComplete);
    return RefreshIndicator(
      onRefresh: () => controller.fetchActivities(),
      child: Visibility(
        visible: activities.isNotEmpty,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: activities.length,
          itemBuilder: (__, index) {
            final activity = controller.activities[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.whiteishColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'In Progress',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          activity.receiver.name,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '|',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: AppColors.blackColor.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          activity.receiver.phone,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.blackColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    activity.destination.address,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.blackColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: Center(
          child: Text('No activities in progress'),
        ),
      ),
    );
  }
}
