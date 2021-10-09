import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 130,
                child: Container(
                  width: 80,
                  height: 80,
                  child: Image(
                    image: AssetImage('assets/Group.png'),
                  ),
                ),
              ),
              Positioned(
                top: 160,
                child: Container(
                  width: 360,
                  height: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: Color.fromRGBO(250, 250, 250, 1),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Positioned(
                          child: Column(
                            children: [
                              Container(
                                width: 335,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 335,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(0, 0,
                                                        0, 0.07999999821186066),
                                                    offset: Offset(0, 18),
                                                    blurRadius: 40)
                                              ],
                                              color: Color(0xFFFAFAFA),
                                            ))),
                                    Positioned(
                                        top: 29,
                                        left: 251,
                                        child: Container(
                                            width: 84,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                    width: 84,
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      border: Border.all(
                                                        color: Color.fromRGBO(
                                                            254, 188, 82, 1),
                                                        width: 1,
                                                      ),
                                                    ),
                                                  )),
                                              Positioned(
                                                  top: 10,
                                                  left: 24.762500762939453,
                                                  child: Text(
                                                    'Track',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.manrope(
                                                        color: Color.fromRGBO(
                                                            0,
                                                            0,
                                                            0,
                                                            0.6000000238418579),
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height: 1),
                                                  )),
                                            ]))),
                                    Positioned(
                                        top: 9,
                                        left: 14,
                                        child: Text(
                                          'Postbird is delivering your package',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.manrope(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.6000000238418579),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        )),
                                    Positioned(
                                        top: 62,
                                        left: 158,
                                        child: Text(
                                          'ETA 02:12 PM',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.manrope(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.3499999940395355),
                                              fontSize: 10,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        )),
                                    Positioned(
                                        top: 62,
                                        left: 14,
                                        child: Text(
                                          'David',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.manrope(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.3499999940395355),
                                              fontSize: 10,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        )),
                                    Positioned(
                                      top: 44,
                                      left: 14,
                                      child: Container(
                                        width: 205,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                top: 5,
                                                left: 0,
                                                child: Container(
                                                    width: 205,
                                                    height: 6,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                2.5),
                                                        topRight:
                                                            Radius.circular(
                                                                2.5),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                2.5),
                                                        bottomRight:
                                                            Radius.circular(
                                                                2.5),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          255,
                                                          255,
                                                          255,
                                                          0.7599999904632568),
                                                    ))),
                                            Positioned(
                                                top: 5,
                                                left: 0,
                                                child: Container(
                                                    width: 100,
                                                    height: 6,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                2.5),
                                                        topRight:
                                                            Radius.circular(
                                                                2.5),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                2.5),
                                                        bottomRight:
                                                            Radius.circular(
                                                                2.5),
                                                      ),
                                                      gradient: LinearGradient(
                                                          begin: Alignment(
                                                              -2.1872713565826416,
                                                              0),
                                                          end: Alignment(0,
                                                              -2.1872713565826416),
                                                          colors: [
                                                            Color.fromRGBO(
                                                                180,
                                                                176,
                                                                254,
                                                                0.6700000166893005),
                                                            Color.fromRGBO(
                                                                152,
                                                                147,
                                                                244,
                                                                0.6700000166893005)
                                                          ]),
                                                    ))),
                                            Positioned(
                                              top: 0,
                                              left: 93,
                                              child: Container(
                                                  width: 14,
                                                  height: 14,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                  child:
                                                      Stack(children: <Widget>[
                                                    Positioned(
                                                        top: 1.3378305435180664,
                                                        left: 0.679410457611084,
                                                        child: Image(
                                                          width: 15,
                                                          height: 13,
                                                          image: AssetImage(
                                                            'assets/Path.png',
                                                          ),
                                                        )),
                                                  ])),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28.0,70,28,30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: FlatButton(
                              color: Colors.grey[600],
                              onPressed: null,
                              child: Text(
                                'Send Package',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 335,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Color(0xFFFBD351),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 0,
                              left: 20,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      'Postbird Business',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.manrope(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.6000000238418579),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w700,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'We can help your business',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.manrope(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.3499999940395355),
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                          height: 1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Image(
                                  height: 103,
                                  width: 132,
                                  image: AssetImage(
                                    'assets/box.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 20,
                child: Container(
                  width: 320,
                  height: 110,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          10.0, // Move to right 10  horizontally
                          10.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.lock_clock,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              'Rewards',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Manrope',
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 16,
                        child: Container(
                          width: 150,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Text(
                            '5000 Points',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 22,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 150,
                        bottom: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          child: FlatButton.icon(
                              color: Colors.grey[600],
                              onPressed: null,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.orangeAccent,
                                size: 20,
                              ),
                              label: Text(
                                'Track Order',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Manrope',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'message',
            icon: Icon(
              Icons.message_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'person',
            icon: Icon(
              Icons.person_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
