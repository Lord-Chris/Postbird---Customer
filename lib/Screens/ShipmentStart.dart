import 'package:flutter/material.dart';
import 'package:postbird/Screens/SelectDate.dart';

class ShipmentStart extends StatefulWidget {
  final name;
  final ids;
  const ShipmentStart({Key? key, this.name, this.ids}) : super(key: key);
  @override
  _ShipmentStartState createState() => _ShipmentStartState();
}

class _ShipmentStartState extends State<ShipmentStart> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/Maps.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 15, 10, 25),
                child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                            offset: Offset(0, 18),
                            blurRadius: 40)
                      ],
                      color: Colors.white,
                    ),
                    child: Stack(children: <Widget>[
                      Positioned(
                        top: screenHeight * 0.087,
                        left: screenWidth * 0.06,
                        child: Image(
                          image: AssetImage('assets/Path.png'),
                        ),
                      ),
                      Positioned(
                          top: screenHeight * 0.087,
                          left: screenWidth * 0.15,
                          child: Text(
                            '24 Adetokunbo Ademola Str...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(27, 27, 27, 1),
                                fontFamily: 'Manrope',
                                fontSize: 19,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          )),
                      Positioned(
                        top: screenHeight * 0.025,
                        left: screenWidth * 0.062,
                        child: Image(
                          image: AssetImage('assets/clock.png'),
                        ),
                      ),
                      Positioned(
                          top: screenHeight * 0.03,
                          left: screenWidth * 0.15,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectDate()));
                            },
                            child: Text(
                              'Select Date',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Manrope',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          )),
                      Positioned(
                          top: screenHeight * 0.15,
                          left: screenWidth * 0.062,
                          child: Container(
                              width: 20.44871711730957,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                color: Color.fromRGBO(125, 224, 200, 1),
                              ))),
                      Positioned(
                          top: screenHeight * 0.15,
                          left: screenWidth * 0.15,
                          child: Text(
                            'Put Destination',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                      Positioned(
                          top: 98,
                          left: 60,
                          child: Container(
                              width: 267,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ))),
                      Positioned(
                          top: 53,
                          left: 60,
                          child: Container(
                              width: 267,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ))),
                      Positioned(
                        top: screenHeight * 0.12,
                        left: screenWidth * 0.09,
                        child: Image(
                          image: AssetImage('assets/Line.png'),
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.06,
                        left: screenWidth * 0.09,
                        child: Image(
                          image: AssetImage('assets/Line.png'),
                        ),
                      ),
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
