import 'dart:async';

import 'package:flutter/material.dart';
import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/Screens/Login1.dart';
import 'package:postbird/Screens/registration screens/Register.dart';
import 'package:postbird/Screens/registration%20screens/CreateAccount2.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
} 

class _LoginState extends State<Login> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 3), () {
      controller.success();
    });
  }
 
  String email = "", avatar = "", fullname = "", id = "";
  bool testLogin = true;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      email = preferences.getString("email");
      fullname = preferences.getString("name");
    });
    //print('email: ' + email);
   // print('ID: ' + id);
    //print('name: ' + fullname.toString());
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(children: <Widget>[
              Positioned(
                top: screenHeight * 0.09,
                left: screenWidth * 0.3,
                child: Container(
                    // width: 131,
                    // height: 133,
                    //color: Colors.blue,
                    child: Stack(children: <Widget>[
                  Positioned(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            ),
                          ),
                          //color: Colors.orange,
                          width: 131,
                          height: 133,
                          child: Stack(children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 20,
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Image.asset('assets/group2.png'),
                              ),
                            ),
                          ]))),
                ])),
              ),
              Positioned(
                  top: screenHeight * 0.3,
                  left: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: screenHeight * 0.13,
                            left: screenWidth * 0.2,
                            child: Text(
                              'Welcome to Post Bird',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.8999999761581421),
                                  fontFamily: 'Manrope',
                                  fontSize: 21,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: screenHeight * 0.18,
                            left: screenWidth * 0.16,
                            child: Text(
                              'Deliver your package nationwide \n without hesitation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.6000000238418579),
                                  fontFamily: 'Manrope',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            )),
                        if (id == null)
                          Positioned(
                              top: screenHeight * 0.3,
                              left: screenWidth * 0.01,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login1())
                                          );
                                },
                                child: Container(
                                  width: screenWidth * 0.94,
                                  height: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(107, 103, 210,
                                              0.3499999940395355),
                                          offset: Offset(0, 18),
                                          blurRadius: 40)
                                    ],
                                    color: Colors.orangeAccent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Manrope',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                ),
                              )),
                        if (id == null)
                          Positioned(
                              top: screenHeight * 0.39,
                              left: screenWidth * 0.01,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CreateAccount2()));
                                },
                                child: Container(
                                  width: screenWidth * 0.94,
                                  height: screenHeight * 0.075,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey[400],
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(27, 27, 27, 1),
                                          fontFamily: 'Manrope',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                ),
                              )),
                       // if (testLogin != null)
                         if (id != null)
                          Positioned(
                              top: screenHeight * 0.39,
                              left: screenWidth * 0.01,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NavBar()));
                                },
                                child: Container(
                                  width: screenWidth * 0.94,
                                  height: screenHeight * 0.075,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey[400],
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Dashboard',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(27, 27, 27, 1),
                                          fontFamily: 'Manrope',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                ),
                              )),
                        // Positioned(
                        //     top: screenHeight*0.48,
                        //     left:screenWidth*0.01,
                        //     child:Container(
                        //         width: screenWidth*0.94,
                        //         height: screenHeight*0.078,
                        //         decoration: BoxDecoration(
                        //           borderRadius : BorderRadius.only(
                        //             topLeft: Radius.circular(8),
                        //             topRight: Radius.circular(8),
                        //             bottomLeft: Radius.circular(8),
                        //             bottomRight: Radius.circular(8),
                        //           ),
                        //           boxShadow : [BoxShadow(
                        //               color: Color.fromRGBO(107, 103, 210, 0.3499999940395355),
                        //               offset: Offset(0,18),
                        //               blurRadius: 40
                        //           )],
                        //           color: Colors.grey[600],
                        //         ),
                        //       child: Center(
                        //         child: Text('Continue with Fingerprint', textAlign: TextAlign.center, style: TextStyle(
                        //             color: Color.fromRGBO(255, 255, 255, 1),
                        //             fontFamily: 'Manrope',
                        //             fontSize: 16,
                        //             letterSpacing: 0,
                        //             fontWeight: FontWeight.normal,
                        //             height: 1
                        //         ),) ,
                        //       ),
                        //     )
                        // ),
                      ]))),
            ])),
      ),
    );
  }
}
