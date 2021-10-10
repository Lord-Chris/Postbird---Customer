import 'package:postbird/Screens/complete_activity.dart';
import 'package:postbird/Screens/i_progress_activity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';

// import 'dart:async';
import 'dart:convert';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool inProgressIsSelected = true;
  bool completeIsSelected = false;

String? email, password;
String? id;
String? surl2;
List activites = [];
// var sd = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
    print('ID: ' + id!);

    var surl = Strings.SECBASE_URL;
    var surl2 = surl + id!;
    print(surl2);
    print(id);
  }

Future fetchActivity() async{
  // print("ongoing");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
    print('ID: ' + id!);

    var surl = Strings.SECBASE_URL;
    var surl2 = surl + id!;
    print(surl2);
    print(id);

    final response =    
        await http.get(Uri.parse(surl2));

   final data = jsonDecode(response.body);  
    //  print(data);   
    if(data['success'] == true){
     setState(() {
       activites = data['data'];
     });
    }
     print("Processsssssssssssssssssssssssssssssssssssssssssssssssssss");
    //  print(activites);
}
//
//k-dev.org/moyin.php
Future login() async {
   // print("ongoing");
    final response =
        await http.post(Uri.parse(Strings.BASE_URL + 'login'), body: {
      "email": "niyijameson21@gmail.com",
      "password": "moyosore123",
    });

   final data = jsonDecode(response.body);  
     print(data);     
    
  }


 @override
  void initState() {
   getPref();
  //  fetchActivity();
   login();

    // This captures errors reported by the FLUTTER framework.
    FlutterError.onError = (FlutterErrorDetails details) {
      print("=================== CAUGHT FLUTTER ERROR");
      // Send report
      // NEVER REACHES HERE - WHY?
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(
        0xFFFEBC52,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: Center(
                child: Text(
                  'My Activity',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(
                      0xFFFFFFFF,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: screenWidth,
                height:screenHeight,
                decoration: BoxDecoration(
                  color: Color(
                    0xFFFFFFFF,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 60,
                        left: 60,
                        top: 40,
                        bottom: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                inProgressIsSelected = true;
                                completeIsSelected = false;
                              });
                            },
                            child: Text(
                              'In Progress',
                              style: GoogleFonts.manrope(
                                color: inProgressIsSelected
                                    ? Color(
                                  0xFFFEBC52,
                                )
                                    : Color(
                                  0xFF464646,
                                ),
                                fontWeight: inProgressIsSelected
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                inProgressIsSelected = false;
                                completeIsSelected = true;
                              });
                            },
                            child: Text(
                              'Complete',
                              style: GoogleFonts.manrope(
                                color: completeIsSelected
                                    ? Color(
                                  0xFFFEBC52,
                                )
                                    : Color(
                                  0xFF464646,
                                ),
                                fontWeight: completeIsSelected
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                    children: <Widget>[
                    SizedBox(
                      height: 450,
                    child: ListView(
                      shrinkWrap: false,
                    children: <Widget>[
                      inProgressIsSelected
                                ? InProgressActivityTwo()
                                : CompleteActivity()
                    ])
                    )
                    ]
                    )
                    // Expanded(
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height / 2,
                    //     width: double.infinity,
                    //     child: Column(
                    //       children: [
                    //         inProgressIsSelected
                    //             ? InProgressActivityTwo()
                    //             : CompleteActivity()
                    //       ]
                    //     )
                    //   )
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}