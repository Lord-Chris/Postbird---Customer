import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromoDetails extends StatefulWidget {
  @override
  _PromoDetailsState createState() => _PromoDetailsState();
}

class _PromoDetailsState extends State<PromoDetails> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.orange[300],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Container(
                  height:screenHeight*0.26 ,
                    width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    color : Colors.orange[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13.0,13,0,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                            height: 70,
                            child: Image(image: AssetImage('assets/group2.png'))),
                        Text(
                          'Soft Launch Promo Get 20% Off',
                          maxLines: 2,
                          style: TextStyle(
                              color: Color.fromRGBO(27, 27, 27, 1),
                              fontFamily: 'Manrope',
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            width:100 ,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '#postbird',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'Manrope',
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Text(
                  'Get 20% off Delivery',
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
                padding: EdgeInsets.fromLTRB(10,5,10,20),
                child: Text(
                  'Available until 24th July 2021',
                  style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Manrope',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),

                ),
              ),
              Padding( padding: EdgeInsets.fromLTRB(10,10,10,20),

                child: Text(
                  'Use this Voucher in payment page and enjoy your 5% off',
                  maxLines: 2,
                  style: TextStyle(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      fontFamily: 'Manrope',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                    color : Colors.grey[200],
                  ),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Voucher',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Manrope',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      Text(
                        'POSTBIRD45',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Manrope',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      Text(
                        'USE',
                        style: TextStyle(
                            color: Colors.orange,
                            fontFamily: 'Manrope',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ],
                  ),
                  width:screenWidth ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
