import 'package:postbird/main.dart';
import 'package:postbird/pick.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/navigator.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageOn(),
    );
  }
}

class HomePageOn extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/third.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child:
                    Text('Create an account ', 
                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ), 
                      ),
              ),
                 Container(
                   margin: EdgeInsets.all(20),
                   alignment: Alignment.bottomCenter,
                   child: 
                   Text('Create your quick account with Postbird \n and fill up package details',
                     textAlign: TextAlign.center,
                     style: GoogleFonts.montserrat(
                                   fontWeight: FontWeight.w400,
                                   fontSize: 16,
                                   color: Colors.white,
                     ),
                   ),
                 ),
                 Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Pick()
                                          )
                                          );      
                                },
                                child: Container(
                                  margin: EdgeInsets.all(20),
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
                                  width:325,
                                  height: 56,
                                  child: Center(
                                  
                                    child: Text(
                                      'Continue',
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
                              ),
                                ),

 // TextButton(
         //   onPressed: () => MNavigator.goToMeemos(context),
           // child: Text(
            //  "My Meemo's",
            //  style: TextStyle(
           //     color: Colors.white
           //   ),
         //   ),
       //   )






                          Container(
                            child: GestureDetector(
                              onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Login()
                                  //         )
                                  //         );      
                                },

                            child: Container(
                            margin: EdgeInsets.all(10),
                             decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  width:325,
                                  height: 56,
                                  child: Center(
                                    child: Text(
                                      'Skip',
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
                            )
                          )      
            ],
          )
          ),
    );
  }
}