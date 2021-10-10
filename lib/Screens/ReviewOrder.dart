import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postbird/Screens/Finding Driver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/strings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReviewOrder extends StatefulWidget {
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
  final recnumber;
  final recname;
  final recnote;
  final zipcode;
  final type;
  final fragile;
  final packagename;
  final packsize;

  const ReviewOrder({
    Key? key,
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
    this.recnumber,
    this.recname,
    this.recnote,
    this.zipcode,
    this.type,
    this.fragile,
    this.packagename,
    this.packsize,
  });
  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  final rateConroller = TextEditingController();
  final rateConrollerr = TextEditingController();

  pricegetting() async {
    var ad = Strings.BASE_URL + 'metricpack';
    var from = widget.fromPlaceDetail.toString();
    var to = widget.toPlaceDetail.toString();
    var response = await http.post(Uri.parse(ad),
        headers: {"accept": "application/json"},
        body: {"from": from, "to": to});

    final data = jsonDecode(response.body);
    var stat = data['data'].toString();
    // var messg = data['message'];
    print(stat);
    // var stat = data['data'];
    // print(data);
    return stat;
    // if (stat == true) {
    //   // topUp();
    // } else if (stat == false) {
    //   Toast.show(messg, context,
    //       duration: Toast.LENGTH_LONG,
    //       backgroundColor: Colors.green,
    //       textColor: Colors.white,
    //       gravity: Toast.TOP);
    //   Navigator.pop(context);
    // }
  }

  SharedPreferences? sharedPreferences;

  String name = "",
      phone = "",
      email = "",
      type = "",
      carmodel = "",
      carnumber = "",
      carcolor = "",
      profilepic = "",
      dvype = "",
      dvstatus = "",
      id = "";

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      name = sharedPreferences!.getString("name")!;
      id = sharedPreferences!.getString("id")!;
    });
    //  print(email);
    print(id);
    print(name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    pricegetting();
    //  getCredential();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'Create Order',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: 410,
                height: 900,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(0, 0, 0, 1),
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
                                    style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(0, 0, 0, 1),
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
                                    style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(0, 0, 0, 1),
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
                                        color: Color.fromRGBO(254, 188, 82, 1),
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
                      height: 30,
                    ),
                    Text(
                      'Shipper',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                          height: 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenWidth,
                      height: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Color(0xFFFFFFFF),
                        border: Border.all(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: Image(
                                image: AssetImage(
                                  'assets/Path.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${widget.name}',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700,
                                        height: 1,
                                      ),
                                    ),
                                    Text(
                                      '|',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.manrope(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.3499999940395355),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    Text(
                                      '+234' + '${widget.sendernumber}',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.manrope(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.6000000238418579),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${widget.fromPlaceDetail}',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.manrope(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.3499999940395355),
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Recipient',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                          height: 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenWidth,
                      height: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Color(0xFFFFFFF),
                        border: Border.all(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 30,
                            child: Image(
                              image: AssetImage('assets/ReceipentMarker.png'),
                            ),
                          ),
                          // SizedBox(
                          //   width: 2,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.recname}',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700,
                                        height: 1),
                                  ),
                                  Text(
                                    '|',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.3499999940395355),
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                  Text(
                                    '+234' + '${widget.recnumber}',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.manrope(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontSize: 14,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${widget.toPlaceDetail}',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.3499999940395355),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Package Information',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: screenWidth,
                      height: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Color(0xFFFFFFF),
                        border: Border.all(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 30,
                            child: Image(
                              image: AssetImage('assets/box.png'),
                            ),
                          ),
                          // SizedBox(
                          //   width: 2,
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Customer Message',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${widget.recnote}',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.3499999940395355),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                    height: 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Divider(
                      color: Color(
                        0xFFE5E5E5,
                      ),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.manrope(
                                  color: Color.fromRGBO(70, 70, 70, 1),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              ' ',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.manrope(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping Assurance',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.manrope(
                                  color: Color.fromRGBO(70, 70, 70, 1),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              '2',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.manrope(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.manrope(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                  height: 1),
                            ),
                            FutureBuilder(
                                future: pricegetting(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.data == null) {
                                    return Text('Calculating Price',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold));
                                  } else {
                                    return Column(
                                      children: [
                                        new Visibility(
                                            visible: false,
                                            child: TextFormField(
                                                enabled: false,
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: rateConroller
                                                  ..text =
                                                      snapshot.data.toString(),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'You\'re getting' +
                                                      '₦\' 00'.replaceAllMapped(
                                                          new RegExp(
                                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                          (Match m) =>
                                                              "${m[1]},") +
                                                      '.00' +
                                                      ' to ',
                                                  hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.red))),
                                        Row(
                                          children: [
                                            Text('           '),
                                            Text(
                                              'Credits ' + snapshot.data,
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.manrope(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 24,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }
                                }),
                            //  Text(
                            //   '₦1042.23',
                            //   textAlign: TextAlign.right,
                            //   style: GoogleFonts.manrope(
                            //       color: Color.fromRGBO(0, 0, 0, 1),
                            //       fontSize: 24,
                            //       letterSpacing: 0,
                            //       fontWeight: FontWeight.w700,
                            //       height: 1),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        var credits = rateConroller.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FindingDriver(
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
                                      recnumber: widget.recnumber,
                                      recname: widget.recname,
                                      recnote: widget.recnote,
                                      zipcode: widget.zipcode,
                                      credits: credits,
                                      type: widget.type,
                                      fragile: widget.fragile,
                                      packagename: widget.packagename,
                                      packsize: widget.packsize,
                                      userid: id,
                                    ))
                            // MaterialPageRoute(
                            //     builder: (context) => FindingDriver())
                            );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(
                            0xFFFEBC52,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Create Order',
                            style: GoogleFonts.manrope(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
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
                        blurRadius: 40)
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
