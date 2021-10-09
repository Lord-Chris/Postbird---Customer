import 'package:flutter/material.dart';
import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/Screens/Inbox.dart';
class OrderCollected extends StatefulWidget {
  @override
  _OrderCollectedState createState() => _OrderCollectedState();
}

class _OrderCollectedState extends State<OrderCollected> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.green[700],
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            child: Stack(
              children: [

                Positioned(
                  top: screenHeight*0.052,
                  left: screenWidth*0.2,
                  child:Container(
                      width: 216,
                      height: 216,
                      decoration: BoxDecoration(
                        color :Colors.green[600],
                        borderRadius : BorderRadius.all(Radius.elliptical(216, 216)),
                      )
                  ),
                ),
                Positioned(
                    top: screenHeight*0.085,
                    left: screenWidth*0.275,
                    child: Container(
                        width: 162,
                        height: 162,
                        decoration: BoxDecoration(
                          color : Colors.green[500],
                          borderRadius : BorderRadius.all(Radius.elliptical(162, 162)),
                        )
                    )),
                Positioned(
                  top: screenHeight*0.13,
                  left: screenWidth*0.36,
                  child:Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(100, 100)),
                      )
                  ),
                ),
                Positioned(
                  top: screenHeight*0.35,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    child: Text(
                      'Delivered ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Manrope',
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight*0.169,
                  left: screenWidth*0.43,
                  child:Container(
                    width: 48,
                    height: 35,
                    child: Image(
                      image: AssetImage('assets/tick.png'),
                    ),
                  ),
                ),
                Positioned(
                  right: screenWidth*0.01,
                  top: screenHeight*0.4,
                  left: screenWidth*0.01,
                  child: Container(
                    child: Text(
                    'your order has arrived at its destination',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),
                ),
                  ),  ),
                Positioned(
                  top: screenHeight*0.45,
                    left: 0,
                    child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          boxShadow : [BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(0,18),
                              blurRadius: 40
                          )],
                          color : Colors.white,
                        ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: screenHeight*0.05,
                            left: screenWidth*0.06,
                            child: Container(
                                width: 158,
                                height: 80,
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
                                            width: 50,
                                            height: 50,
                                            child: ClipOval(
                                              child: Stack(
                                                  children: <Widget>[
                                                    Positioned(
                                                        top: 0,
                                                        left: 0,
                                                        child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                              color : Color.fromRGBO(216, 216, 216, 1),
                                                              borderRadius : BorderRadius.all(Radius.elliptical(46, 46)),
                                                            )
                                                        )
                                                    ),
                                                    Positioned(
                                                        top: -3.2857143878936768,
                                                        left: 2.4868995751603507e-14,
                                                        child: Container(
                                                            width: 45.756614685058594,
                                                            height: 51.47618865966797,
                                                            decoration: BoxDecoration(
                                                              // image : DecorationImage(
                                                              //     image: AssetImage('assets/manface.png'),
                                                              //     fit: BoxFit.fitWidth
                                                              // ),
                                                            )
                                                        )
                                                    ),
                                                  ]
                                              ),
                                            ),
                                          )
                                      ),
                                      Positioned(
                                          top: 2,
                                          left: 58,
                                          child: Text('Mark OUE', textAlign: TextAlign.left, style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                                              fontFamily: 'Manrope',
                                              fontSize: 16,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.bold,
                                              height: 1
                                          ),)
                                      ),
                                      Positioned(
                                          top: 30,
                                          left: 58,
                                          child: Text('8DWH823', textAlign: TextAlign.left, style: TextStyle(
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
                            top: screenHeight*0.05,
                            left: screenWidth*0.6,
                              child: FloatingActionButton(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                          ),
                          Positioned(
                            top: screenHeight*0.05,
                            left: screenWidth*0.8,
                            child: FloatingActionButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Inbox()));
                              },
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.chat,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenHeight*0.15,
                            left: screenWidth*0.05,
                            right: screenWidth*0.05,
                            child: Container(
                              width: screenWidth,
                              height:91,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                color : Colors.white,
                                border : Border.all(
                                  color:  Colors.grey[300],
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: screenHeight*0.03,
                                      left: screenWidth*0.01,
                                      child: Image(
                                        image: AssetImage('assets/Courier.png'),
                                      ),
                                    ),
                                    Positioned(
                                        top: screenHeight*0.05,
                                        left: screenWidth*0.15,
                                        child: Text('24 Adetokunbo Ademola Street, Victoria \n Island, Lagos', textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Manrope',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),
                                    Positioned(
                                        top: screenHeight*0.02,
                                        left: screenWidth*0.15,
                                        child: Text('Kitani Saravasti', textAlign: TextAlign.left, style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Manrope',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),
                                    Positioned(
                                        top: screenHeight*0.02,
                                        left: screenWidth*0.445,
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
                                        top: screenHeight*0.02,
                                        left: screenWidth*0.46,
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
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenHeight*0.3,
                            left: screenWidth*0.05,
                            right: screenWidth*0.05,
                            child: Container(
                              width: screenWidth,
                              height:91,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                color : Colors.white,
                                border : Border.all(
                                  color: Colors.grey[300],
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: screenHeight*0.03,
                                      left: screenWidth*0.0,
                                        child: Image(
                                          image: AssetImage('assets/ReceipentMarker.png'),
                                        ),
                                    ),
                                    Positioned(
                                        top: screenHeight*0.05,
                                        left: screenWidth*0.15,
                                        child: Text('80 Adetokunbo Ademola Street, Victoria \n Island, Lagos', textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Manrope',
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1
                                          ),)
                                    ),
                                    Positioned(
                                        top: screenHeight*0.02,
                                        left: screenWidth*0.15,
                                        child: Text('Jonathan', textAlign: TextAlign.left, style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Manrope',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),
                                    Positioned(
                                        top: screenHeight*0.02,
                                        left: screenWidth*0.34,
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
                                        top: screenHeight*0.02,
                                        left: screenWidth*0.36,
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
                              ),
                            ),
                          ),
                          Positioned(
                              top: screenHeight*0.45,
                              left: screenWidth*0.05,
                              right: screenWidth*0.05,
                              child: Container(
                                width: screenWidth,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                  color : Colors.orange,
                                ),
                                child: FlatButton(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
                                    },
                                    child: Text(
                                      'Back to Home',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Manrope',
                                            fontSize: 20,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                                ),
                                    ),
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
