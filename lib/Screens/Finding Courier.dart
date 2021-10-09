import 'package:flutter/material.dart';
import 'package:postbird/Screens/On progress.dart';

class FindingCourier extends StatefulWidget {
  @override
  _FindingCourierState createState() => _FindingCourierState();
}

class _FindingCourierState extends State<FindingCourier> {
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
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Onprogres()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top:screenHeight*0.53 ),
                  child: Container(

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 40,
                                left: 0,
                                child: Container(
                                    width: screenWidth,
                                    height: screenHeight*0.427,
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
                                      color : Color.fromRGBO(250, 250, 250, 1),
                                    )
                                )
                            ),
                            Positioned(
                                top: screenHeight*0.27,
                                left: screenWidth*0.33,
                                child: Text('Creating Order...', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.8999999761581421),
                                    fontFamily: 'Manrope',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1
                                ),)
                            ),
                            Positioned(
                                top:  screenHeight*0.31,
                                left: screenWidth*0.16,
                                child: Text('A  Courier will pick up your package soon.', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                                    fontFamily: 'Manrope',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                            Positioned(
                                top: screenHeight*0.12,
                                left: screenWidth*0.35,
                                child: Container(
                                    width: 102,
                                    height: 91,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                width: 102.00020599365234,
                                                height: 91.00017547607422,

                                                child:Image(
                                                  image: AssetImage('assets/group4.png'),
                                                ),
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
  