import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Faq2 extends StatefulWidget {
  @override
  _Faq2State createState() => _Faq2State();
}

class _Faq2State extends State<Faq2> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.orange[300],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                'FAQ',
                style: TextStyle(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    fontFamily: 'Manrope',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.orange,
                  ),
                  onPressed:null)
            ],
          ),
          body: ListView(
            children:ListTile.divideTiles(
              context: context,
                tiles:[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,20,10,10),
                    child: Text(
                      'Top Questions',
                      style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontFamily: 'Manrope',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1),

                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: Icon(
                      Icons.star,
                      color: Colors.orange,

                    ),
                    minLeadingWidth: 10,
                    title: Text(
                      'How do i deliver my packages?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    minLeadingWidth: 10,
                    title: Text(
                      'How many days refund ticket?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    minLeadingWidth: 10,
                    title: Text(
                      'How do i enter promo code?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,30,10,30),
                    child: Text(
                      'Popular Topics',
                      style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontFamily: 'Manrope',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1),

                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,

                    minLeadingWidth: 0,
                    title: Text(
                      'How do i Cancel order?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'Give Review or tips to Courier?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'Top Up E-Wallet?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'How do i enter voucher?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,30,10,30),
                    child: Text(
                      'Frequently asked Questions',
                      style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontFamily: 'Manrope',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1),

                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'How to send my package?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'Can i change pick up location?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'How do i know exactly my package weight?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'Can i send a fragile package?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 10,
                    title: Text(
                      'Can i track my package?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  ),

                ]
            ).toList(),


          ),
        ),
      ),
    );
  }
}
