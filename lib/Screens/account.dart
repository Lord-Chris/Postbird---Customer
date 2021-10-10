import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/Login.dart';
import 'package:postbird/Screens/Security.dart';
import 'package:postbird/Screens/Profile.dart';
import 'package:postbird/Screens/FAQ2.dart';
import 'package:postbird/Screens/NotificationList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NotificationList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

String email = "", avatar = "", fullname = "", id = "", password = "", name = "", profilePic="default.png";
List<List>? info;

 
class _AccountState extends State<Account> {
  getProfileDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email")!;
      password = preferences.getString("pwd")!;
    });

    final response = 
      await http.post(Uri.parse("https://api.postbird.com.ng/api/login"), headers:{"Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLnBvc3RiaXJkLmNvbS5uZ1wvYXBpXC9sb2dpbiIsImlhdCI6MTYzMTk4MDM1OSwiZXhwIjoxNjMxOTgzOTU5LCJuYmYiOjE2MzE5ODAzNTksImp0aSI6IldGMGVJa2tUdUpsM09TQ1EiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.dxulrD4OPxjXz8XAU0-3pyRJkv-NjpZgnXNK_PesiDg  "}, body:{
          "email": email,
          'password': password
        }
      );
      
    final data = jsonDecode(response.body);
    var n = data['data']['name'];
    var profilepic = data['data']['profilepic'];
    setState(() {
      name = n;
      profilePic = profilepic;
    });
    
    print(name);
    // info[0] = data;

    print(data);
  }

  signOut() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    setState(() {
      prefer.remove("email");
      prefer.remove("id");
      prefer.remove("mobile");
      id = prefer.getString("id")!;
      password = prefer.getString('pwd')!;
    });

    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new Login()),
    );
  }

  void initState() {
   getProfileDetails();

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(
        0xFFFEBC52,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 40,
                bottom: 15,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Account',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(
                          0xFFFFFFFF,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                                      signOut();
                                    },
                      child: Text(
                        'Logout',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(
                            0xFFFFFFFF,
                          ),
                        ),
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
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        50,
                        20,
                        10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                        'https://api.postbird.com.ng/public/img/profile/'+profilePic,
                                        height: 80.0,
                                        width: 80.0,
                                    ),
                                ), 
                          // Container(
                          //   height: height / 12,
                          //   width: width / 5,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   // child: Image.network('https://picsum.photos/250?image=9'),
                          //   // 'https://api.postman.com.ng/public/img/profile/'+profilePic,
                          //   child: Image(
                          //     height: height / 12,
                          //     width: width / 5,
                          //     image: NetworkImage(
                          //       'https://api.postbird.com.ng/public/img/profile/'+profilePic,
                          //     ),

                              
                          //   ),
                          // ),
                          Container(
                            padding: EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 5,
                              bottom: 5,
                            ),
                            height: height / 12,
                            width: width / 1.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(
                                0xFFFEBC52,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    name,
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(
                                        0xFFFFFFFF,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/edit_profile',
                                      );
                                    },
                                    child: Text(
                                      'Edit Profile',
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: Color(
                                          0xFFFFFFFF,
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        15,
                        20,
                        10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height / 6,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(
                                  0xFFFAFAFA,
                                ),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '16',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: Color(
                                      0xFF464646,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Send Package',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(
                                      0xFF464646,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height / 6,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(
                                  0xFFFAFAFA,
                                ),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4,212',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: Color(
                                      0xFF464646,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Points',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(
                                      0xFF464646,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage(
                                      'assets/Icon.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    'Account Settings',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(
                                        0xFF000000,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 20,
                      ),
                      child: Container(
                        height: 1,
                        width: width / 1.25,
                        color: Color(
                          0xFFE2E2E2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/change_password');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage(
                                      'assets/Icon.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                                    },
                                    child: Text(
                                      'Security',
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(
                                          0xFF000000,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 20,
                      ),
                      child: Container(
                        height: 1,
                        width: width / 1.25,
                        color: Color(
                          0xFFE2E2E2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage(
                                      'assets/Icon.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    'Notification',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(
                                        0xFF000000,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 20,
                      ),
                      child: Container(
                        height: 1,
                        width: width / 1.25,
                        color: Color(
                          0xFFE2E2E2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/help');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage(
                                      'assets/Icon.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Faq2()));
                                    },
                                    child: Text(
                                      'Help & FAQ',
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(
                                          0xFF000000,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 20,
                      ),
                      child: Container(
                        height: 1,
                        width: width / 1.25,
                        color: Color(
                          0xFFE2E2E2,
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
  }
}