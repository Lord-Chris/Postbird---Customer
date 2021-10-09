import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/ReviewOrder.dart';
import 'package:postbird/Screens/Chat.dart';

class Recipient extends StatefulWidget {
  final name;
  final fromPlaceDetail;
  final toPlaceDetail;
  final polylines;
  final polylineCoordinates;
  final stname;
  final dtname;
  final frmlt;
  final frmlg;
  final tolt;
  final tolg;
  final date;
  final sendernumber;
  final notess;
  final type;
  final fragile;
  final packsize;
  const Recipient({
    Key key,
    this.name,
    this.fromPlaceDetail,
    this.toPlaceDetail,
    this.polylines,
    this.polylineCoordinates,
    this.stname,
    this.dtname,
    this.frmlt,
    this.frmlg,
    this.tolt,
    this.date,
    this.tolg,
    this.sendernumber,
    this.notess,
    this.type,
    this.fragile,
    this.packsize,
  });
  @override
  _RecipientState createState() => _RecipientState();
}

class _RecipientState extends State<Recipient> {
  String recnumber = '';
  String recname = '';
  String packagename = '';
  String recnote = '';
  String zipcode = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Create Order',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                    height: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: 410,
                height: 900,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Container(
                            width: 311,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 34,
                                  left: 0,
                                  child: Text(
                                    'Shipment Form',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Manrope',
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 34,
                                  left: 122,
                                  child: Text(
                                    'Recipient Form',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Manrope',
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 14,
                                  left: 37,
                                  child: Container(
                                      width: 241,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(227, 227, 227, 1),
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 144,
                                  child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(107, 103,
                                                  210, 0.3499999940395355),
                                              offset: Offset(0, 18),
                                              blurRadius: 40)
                                        ],
                                        color: Color.fromRGBO(233, 233, 233, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(26, 26)),
                                      ))),
                              Positioned(
                                  top: 5,
                                  left: 149,
                                  child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(107, 103,
                                                  210, 0.3499999940395355),
                                              offset: Offset(0, 18),
                                              blurRadius: 40)
                                        ],
                                        color: Color.fromRGBO(254, 188, 82, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(16, 16)),
                                      ))),
                              Positioned(
                                  top: 34,
                                  left: 246.5,
                                  child: Text(
                                    'Review Order',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(70, 70, 70, 1),
                                        fontFamily: 'Manrope',
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 0,
                                  left: 265,
                                  child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(107, 103,
                                                  210, 0.3499999940395355),
                                              offset: Offset(0, 18),
                                              blurRadius: 40)
                                        ],
                                        color: Color.fromRGBO(233, 233, 233, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(26, 26)),
                                      ))),
                              Positioned(
                                  top: 5,
                                  left: 270,
                                  child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(107, 103,
                                                  210, 0.3499999940395355),
                                              offset: Offset(0, 18),
                                              blurRadius: 40)
                                        ],
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(16, 16)),
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 23,
                                  child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(107, 103,
                                                  210, 0.3499999940395355),
                                              offset: Offset(0, 18),
                                              blurRadius: 40)
                                        ],
                                        color: Color.fromRGBO(233, 233, 233, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(26, 26)),
                                      ))),
                              Positioned(
                                  top: 5,
                                  left: 28,
                                  child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(107, 103,
                                                  210, 0.3499999940395355),
                                              offset: Offset(0, 18),
                                              blurRadius: 40)
                                        ],
                                        color: Color.fromRGBO(254, 188, 82, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(16, 16)),
                                      ))),
                            ]))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Recipient Name',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                       validator: (e) {
                                if (e.isEmpty) {
                                  return "Please Enter Name";
                                }
                              },
                              onSaved: (e) => recname = e,
                              onChanged: (String text) {
                                setState(() {
                                  recname = text;
                                });
                                print(recname);
                              },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: GoogleFonts.manrope(
                            color: Colors.grey,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFDEDEDE,
                            ),
                          ),
                        ),
                        labelStyle: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xFF1B1B1B,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFFEBC52,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Address',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: '${widget.toPlaceDetail}',
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Shipping Destination',
                        hintStyle: GoogleFonts.manrope(
                            color: Colors.grey,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFDEDEDE,
                            ),
                          ),
                        ),
                        labelStyle: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xFF1B1B1B,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFFEBC52,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Postal Zip',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                       validator: (e) {
                                if (e.isEmpty) {
                                  return "Please Enter Phone No";
                                }
                              },
                              onSaved: (e) => zipcode = e,
                              onChanged: (String text) {
                                setState(() {
                                  zipcode = text;
                                });
                                print(zipcode);
                              },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'XXXXX',
                        hintStyle: GoogleFonts.manrope(
                            color: Colors.grey,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFDEDEDE,
                            ),
                          ),
                        ),
                        labelStyle: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xFF1B1B1B,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFFEBC52,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Recipient Phone Number',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(
                                  0xFFDEDEDE,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 92,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: Image(
                                    width: 42,
                                    height: 26,
                                    image: AssetImage(
                                      'assets/Image2.png',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Please Enter Phone No";
                                }
                              },
                              onSaved: (e) => recnumber = e,
                              onChanged: (String text) {
                                setState(() {
                                  recnumber = text;
                                });
                                print(recnumber);
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(
                                      0xFFDEDEDE,
                                    ),
                                  ),
                                ),
                                prefixText: '+234   ',
                                prefixStyle: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(
                                    0xFF1B1B1B,
                                  ),
                                ),
                                labelStyle: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(
                                    0xFF1B1B1B,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(
                                      0xFFFEBC52,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (e) {
                                if (e.isEmpty) {
                                  return "Please Enter Phone No";
                                }
                              },
                              onSaved: (e) => packagename = e,
                              onChanged: (String text) {
                                setState(() {
                                  packagename = text;
                                });
                                print(packagename);
                              },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Package Name',
                        hintStyle: GoogleFonts.manrope(
                            color: Colors.grey,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFDEDEDE,
                            ),
                          ),
                        ),
                        labelStyle: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xFF1B1B1B,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(
                              0xFFFEBC52,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Aditional Notes',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                              color: Color.fromRGBO(27, 27, 27, 1),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        Text(
                          '14/1200',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: screenHeight * 0.2,
                      width: screenWidth,
                      child: TextFormField(
                        validator: (e) {
                                if (e.isEmpty) {
                                  return "Please Enter Note";
                                }
                              },
                              onSaved: (e) => recnote = e,
                              onChanged: (String text) {
                                setState(() {
                                  recnote = text;
                                });
                                print(recnote);
                              },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 0),
                          hintText: 'Please Confirm',
                          hintStyle: GoogleFonts.manrope(
                              color: Colors.grey,
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xFFDEDEDE,
                              ),
                            ),
                          ),
                          labelStyle: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xFF1B1B1B,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xFFFEBC52,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    107, 103, 210, 0.3499999940395355),
                                offset: Offset(0, 18),
                                blurRadius: 40)
                          ],
                          color: Color.fromRGBO(254, 188, 82, 1),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewOrder(
                                    name: widget.name,
                                    date: widget.date,
                                    tolt: widget.tolt,
                                    tolg: widget.tolg,
                                    frmlg: widget.frmlg,
                                    frmlt: widget.frmlt,
                                    fromPlaceDetail: widget.fromPlaceDetail,
                                    toPlaceDetail: widget.toPlaceDetail,
                                    sendernumber: widget.sendernumber,
                                    notess: widget.notess,
                                    recnumber: recnumber,
                                    recname: recname,
                                    recnote: recnote,
                                    zipcode: zipcode,
                                    type: widget.type,
                                    fragile: widget.fragile,
                                    packagename:packagename,
                                    packsize: widget.packsize,


                                    )));
                          },
                          child: Text(
                            'Continue',
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                      offset: Offset(0, 18),
                      blurRadius: 40,
                    ),
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
