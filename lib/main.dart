import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:postbird/onboarding.dart';
import 'package:postbird/pick.dart';
import 'package:postbird/pickup.dart';
import 'package:postbird/navigator.dart';


import 'package:postbird/Screens/Selectdate.dart';
import 'package:postbird/Screens/NotificationList.dart';
import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/Screens/Login.dart';
import 'package:postbird/Screens/NotificationDetails3.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';



void main() {
  runApp(MaterialApp(
    //home: Login(),
    home: SplashScreen(),
    
    routes: < String, WidgetBuilder> {
    "/onboarding": ( BuildContext context) => HomePageOn(),
    "/pick": ( BuildContext context) => Pick(),
    "/pickup": ( BuildContext context) => PickUp(),
   },
    debugShowCheckedModeBanner: false,
  ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int value = 0;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
    });

    print(value);
  }

@override
void initState() {
  getPref();
  super.initState();
  Timer (Duration (seconds: 5), () => {
    if(value == 1){       
      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()
                                          )
                                          )   
    }else{
      MNavigator.goToHomePageOn(context)
    }
  }
  ); 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 188, 82, 1),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Container(
                width:50,
                height: 50,
                color: Color.fromRGBO(254, 188, 82, 1),
                
              ),
              Container(
                child: Center(
                  child:  Image.asset("assets/iconframe.png"),
                  ),
              ),
              Container(
                   alignment: Alignment.bottomCenter,
                   child: SpinKitThreeInOut(
                   color: Colors.white,
                  size: 20.0,
                   ),
              ),
            ],
           
          ),
        ),
        
        
        );
   
  }
}





//class SplashScreen extends StatefulWidget {
  //@override
  //_SplashScreenState createState() => _SplashScreenState();
//}

//class _SplashScreenState extends State<SplashScreen> {
 // @override
 // Widget build(BuildContext context) {
   // return Scaffold(
     //  body: center(
    //
      // ),
  //  );
 // }
//}

