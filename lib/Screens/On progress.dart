import 'package:flutter/material.dart';
import 'package:postbird/Screens/Collected.dart';
import 'package:postbird/Screens/inbox.dart';

class Onprogres extends StatefulWidget {
  @override
  _OnprogresState createState() => _OnprogresState();
}

class _OnprogresState extends State<Onprogres> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/Maps.png'),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: screenHeight*0.08 ,
              left:screenWidth*0.05 ,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    boxShadow : [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                        offset: Offset(0,18),
                        blurRadius: 40
                    )],
                    color : Color.fromRGBO(250, 250, 250, 1),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                  )
              ),
            ),
            Positioned(
                top: screenHeight*0.25,
                left: screenWidth*0.2,
                child: Container(
                    width: 185,
                    height: 200,
                    child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 1.8055963516235352,
                              left: 0.23551763594150543,
                              child:Image(
                                image: AssetImage('assets/TrackWay.png'),)
                          ),
                        ]
                    )
                )),
            Stack(
              children: [
                Positioned(
                    top:  screenHeight*0.38,
                    left:  screenWidth*0.52,
                    child: Container(
                      width: 154,
                      height: 33,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                            offset: Offset(0,18),
                            blurRadius: 40
                        )],
                        color : Color.fromRGBO(250, 250, 250, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('80 Adetokunbo Ademola', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                      ) ,
                    )
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                    top: screenHeight*0.18,
                    left: screenWidth*0.35,
                    child: Container(
                      width: 154,
                      height: 33,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                            offset: Offset(0,18),
                            blurRadius: 40
                        )],
                        color : Color.fromRGBO(250, 250, 250, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('24 Adetokunbo Ademola', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                      ),
                    )
                ),
              ],
            ),
            Positioned(
                top: screenHeight*0.23,
                left: screenWidth*0.425,
                child: Container(
                    width: 32,
                    height: 32,
                    child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 1.8055963516235352,
                              left: 0.23551763594150543,
                              child:RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child:Image(
                                  image: AssetImage('assets/Courier.png'),),
                              )
                          ),
                        ]
                    )
                )),
            Positioned(
                top: screenHeight*0.42,
                left: screenWidth*0.62,
                child: Container(
                    width: 32,
                    height: 32,
                    child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 1.8055963516235352,
                              left: 0.23551763594150543,
                              child:Image(
                                image: AssetImage('assets/ReceipentMarker.png'),)
                          ),
                        ]
                    )
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(10,screenHeight*0.53,10,10 ),
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                              boxShadow : [BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                                  offset: Offset(0,18),
                                  blurRadius: 40
                              )],
                              color : Colors.white,
                            ),

                        )
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Text('We found courier to pick up \n your package.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.8999999761581421),
                            fontFamily: 'Manrope',
                            fontSize: 19,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1
                        ),)
                    ),
                    Positioned(
                      top: screenHeight*0.11,
                      left: screenWidth*0.06,
                      child: Container(
                          width: 158,
                          height: 47,
                          decoration: BoxDecoration(
                            color : Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child:  //Mask holder Template
                                    Container(
                                      width: 46,
                                      height: 46,
                                      child: ClipOval(
                                        child: Stack(
                                            children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                      width: 46,
                                                      height: 46,
                                                      decoration: BoxDecoration(
                                                        color : Color.fromRGBO(216, 216, 216, 1),
                                                        borderRadius : BorderRadius.all(Radius.elliptical(46, 46)),
                                                      )
                                                  )
                                              ),Positioned(
                                                  top: -3.2857143878936768,
                                                  left: 2.4868995751603507e-14,
                                                  child: Container(
                                                      width: 45.756614685058594,
                                                      height: 51.47618865966797,
                                                      decoration: BoxDecoration(
                                                        image : DecorationImage(
                                                            image: AssetImage('assets/Bitmap.png'),
                                                            fit: BoxFit.fitWidth
                                                        ),
                                                      )
                                                  )
                                              ),
                                            ]
                                        ),
                                      ),
                                    )
                                ),Positioned(
                                    top: 2,
                                    left: 58,
                                    child: Text('Kosin Ken.', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)
                                ),Positioned(
                                    top: 28,
                                    left: 58,
                                    child: Text('Bike Courier', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3499999940395355),
                                        fontFamily: 'Manrope',
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)
                                ),
                              ]
                          )
                      ),
                    ),
                    Positioned(
                      top: screenHeight*0.11,
                      left: screenWidth*0.65,
                      child: Container(
                          width: 91,
                          height: 37,
                          decoration: BoxDecoration(
                            color : Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 91,
                                        height: 37,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          boxShadow : [BoxShadow(
                                              color: Color.fromRGBO(125, 224, 200, 0.44999998807907104),
                                              offset: Offset(0,18),
                                              blurRadius: 40
                                          )],
                                          color : Color.fromRGBO(125, 224, 200, 1),
                                        )
                                    )
                                ),Positioned(
                                    top: 9,
                                    left: 22,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Collected()));
                                      },
                                      child: Text('Pick up', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),),
                                    )
                                ),
                              ]
                          )
                      ) ,
                    ),
                    Positioned(
                        top: screenHeight*0.2,
                        left: screenWidth*0.06,
                        child:Container(
                            width: screenWidth*0.85,
                            height: screenHeight*0.15,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              color : Colors.white,
                              border : Border.all(
                                color: Color.fromRGBO(233, 233, 233, 1),
                                width: 1,
                              ),
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      top: screenHeight*0.02,
                                      left:screenWidth*0.63,
                                      child: Text('View Detail', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(254, 188, 82, 1),
                                          fontFamily: 'Manrope',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Positioned(
                                      top:   screenHeight*0.02,
                                      left: screenWidth*0.05,
                                      child: Text('Deliver to', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.8999999761581421),
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Positioned(
                                      top:  screenHeight*0.08,
                                      left: screenWidth*0.05,
                                      child: Text('24 Adetokunbo Ademola Street, \n Victoria Island, Lagos', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.3499999940395355),
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Positioned(
                                      top: screenHeight*0.05,
                                      left: screenWidth*0.05,
                                      child: Text('Jonathan', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Positioned(
                                      top: screenHeight*0.05,
                                      left: screenWidth*0.23,
                                      child: Text('|', textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 0.3499999940395355),
                                            fontFamily: 'Manrope',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                  ),
                                  Positioned(
                                      top:  screenHeight*0.05,
                                      left: screenWidth*0.26,
                                      child: Text('+234 81 855 48839', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                ]
                            )
                        )
                    ),
                    Positioned(
                        left: screenWidth*0.06,
                        top: screenHeight*0.37,
                      child: Container(
                          width: 144,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            color : Color.fromRGBO(255, 255, 255, 1),
                            border : Border.all(
                              color: Color.fromRGBO(222, 222, 222, 1),
                              width: 1,
                            ),
                          ),
                        child: FlatButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.phone,
                              color: Colors.orange,
                            ),
                            label: Text(
                              'Call'
                            )),
                      )
                    ),
                    Positioned(
                        left: screenWidth*0.5,
                        top: screenHeight*0.37,
                        child: Container(
                            width: 144,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              color : Color.fromRGBO(255, 255, 255, 1),
                              border : Border.all(
                                color: Color.fromRGBO(222, 222, 222, 1),
                                width: 1,
                              ),
                            ),
                          child:FlatButton.icon(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Inbox()));
                              },
                              icon: Icon(
                                Icons.chat,
                                color: Colors.orange,
                              ),
                              label: Text(
                                  'Chat'
                              )),
                        )
                    )
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
