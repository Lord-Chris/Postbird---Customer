import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/controllers/activity_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompleteActivity extends StatelessWidget {
  final String id = "",
      name = "",
      username = "",
      email = "",
      mobile = "",
      token = "";
  final List activites = [];

// getPref() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       id = preferences.getString("id")!;
//     });
//     print('ID: ' + id);

//     var surl = Strings.SECBASE_URL;
//     var surl2 = surl + id;
//     print(surl2);
//     print(id);
//   }

//    fetchActivity() async{
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

//     final response =
//         await http.get(Uri.parse(surl2));

//    final dat = jsonDecode(response.body);
//    print(dat);
//    if(dat['success'] == true ){
//      print("Processsssssssssssssssssssssssssssssssssssssssssssssssssss");
//      var data = dat['data'];
//     var arr = [];
//     for (var i=0; i<data.length; i++){
//       if(data[i]['status'] == "1"){
//       var uid = data[i]['user_id'];
//       print("uid"+uid);
//       final response =
//         await http.get(Uri.parse("http://api.postbird.com.ng/api/getuser/" + uid));
//         final row = jsonDecode(response.body);
//         print("user details"); print(row);
//         if(row['success'] == true){
//           var name = row['data'][0]['name'];
//           var username = row['data'][0]['username'];
//           var email = row['data'][0]['email'];
//           var mobile = row['data'][0]['mobile'];

//           sendData(id, name, username, email, mobile) async{
//                 final response =
//                 await http.post(Uri.parse("https://k-dev.org/postbird/reg/"), headers:{"Authorization" : token}, body:{
//                       "id": id,
//                       "name": name,
//                       "username": username,
//                       "email": email,
//                       "mobile": mobile
//                   }
//                 );
//                 final reqData = jsonDecode(response.body);
//                 var ref = reqData['ref'];

//                 var ar = {"id": data[i][id], "user_id": data[i]['user_id'], "date": data[i]['date'], "address": data[i]['address'],
//                   "detination": data[i]['detination'], "frmlt": data[i]['frmlt'], "tolt": data[i]['tolt'], "frmlg": data[i]['frmlg'], "tolg": data[i]['tolg'],
//                   "amount": data[i]['amount'], "packagedetails": data[i]['packagedetails'], "status": data[i]['status'], "packagename": data[i]['packagename'],
//                   "sendername": data[i]['sendername'], "senderphone": data[i]['senderphone'], "packtype": data[i]['packtype'], "packsize": data[i]['packsize'],
//                   "fragile": data[i]['fragile'], "recipientname": data[i]['recipientname'], "recipientaddress": data[i]['recipientaddress'],
//                   "postalzip": data[i]['postalzip'], "recipientphone": data[i]['recipientphone'], "additionalinfo": data[i]['additionalinfo'],
//                   "created_at": data[i]['created_at'], "updated_at": data[i]['updated_at'], "ref": ref};
//                 arr.add(ar);
//                 // SharedPreferences preferences = await SharedPreferences.getInstance();
//                 // setState(() {
//                 //   preferences.setString('userRef', reqData['ref']);
//                 // });
//                 print("send data");
//                 print(reqData['ref']);
//           }
//           sendData(id, name, username, email, mobile);
//         }
//       }
//     }
//     //  print(data);
//      setState(() {
//        activites = arr;
//      });
//   }
//     //  print(activites);
// }

  final words = ['foo', 'bar', 'baz', "f"];
  final controller = Get.find<ActivityController>();

  Widget build(BuildContext context) {
    final activities = controller.activities.where((e) => e.isComplete);
    return RefreshIndicator(
      onRefresh: () => controller.fetchActivities(),
      child: Visibility(
        visible: activities.isNotEmpty,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: activities.length,
          itemBuilder: (__, index) {
            final activity = controller.activities[index];
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteishColor,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      activity.date,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: AppColors.blackColor.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Received',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.check,
                            color: Colors.green[800],
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Text(
                        'Express',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        activity.destination.address,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.blackColor.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        activity.notes,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.blackColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        replacement: Center(
          child: Text('No completed activities'),
        ),
      ),
    );
  }
}
