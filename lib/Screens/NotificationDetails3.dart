import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/PromoDetails.dart';
class NotificationDetails3 extends StatefulWidget {
  @override
  _NotificationDetails3State createState() => _NotificationDetails3State();
}

class _NotificationDetails3State extends State<NotificationDetails3> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.orange[300],
      child: SafeArea(
          child: Scaffold(
            appBar:  AppBar(
              leading: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                  'Promo Details',
                  style: TextStyle(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      fontFamily: 'Manrope',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),

            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,30,0,10),
                      child: Text(
                        'Package Delivered',
                        style: TextStyle(
                            color: Color.fromRGBO(27, 27, 27, 1),
                            fontFamily: 'Manrope',
                            fontSize: 25,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,40),
                      child: Row(
                        children: [
                          Text(
                            '24th July 2020',
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Manrope',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                          Text(
                            '.',
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Manrope',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Text(
                            '11.32PM',
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Manrope',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,8.0,0,20),
                      child: Row(
                        children: [
                          Text(
                            'See your delivery',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Text(
                            ' here',
                            style: TextStyle(
                                color: Colors.orange,
                                fontFamily: 'Manrope',
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,40),
                      child: Text(
                        'Give us your feed back',
                        style: TextStyle(
                            color: Color.fromRGBO(27, 27, 27, 1),
                            fontFamily: 'Manrope',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(image: AssetImage('assets/sad.png')),
                        Image(image: AssetImage('assets/normal.png')),
                        Image(image: AssetImage('assets/happy.png')),
                      ],),
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width:screenWidth,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),

                        color: Color(
                          0xFFFEBC52,
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PromoDetails()));
                        },
                        child: Text(
                          'Send Feedback',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(
                              0xFFFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
