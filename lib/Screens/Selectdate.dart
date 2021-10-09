import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/Sender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDate extends StatefulWidget {
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
  const SelectDate(
      {Key key,
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
      this.tolg});
  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(
        0xFFE8E8E8,
      ),
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(
                                0xFF000000,
                              ),
                            ),
                          ),
                          Text(
                            'Select Date',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(
                                0xFF000000,
                              ),
                            ),
                          ),
                          Image(
                            height: 20,
                            width: 20,
                            image: AssetImage(
                              'assets/map.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 68,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFE8E8E8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 40,
                          top: 4,
                          child: Image(
                            height: 25,
                            width: 25,
                            image: AssetImage(
                              'assets/clock.png',
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90,
                          top: 5,
                          child: Text(
                            'Mon, Sep 7th 2020',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(
                                0xFF1B1B1B,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 87,
                          top: 40,
                          child: Container(
                            height: 0.5,
                            width: 270,
                            color: Color(
                              0xFF464646,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: CupertinoDatePicker(
                        minimumYear: 1800,
                        maximumYear: DateTime.now().year,
                        initialDateTime: dateTime,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime) =>
                            setState(() => this.dateTime = dateTime),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sender(
                                    name: widget.name,
                                    date: dateTime,
                                    tolt: widget.tolt,
                                    tolg: widget.tolg,
                                    frmlg: widget.frmlg,
                                    frmlt: widget.frmlt,
                                    fromPlaceDetail: widget.stname,
                                    toPlaceDetail: widget.dtname
                                    )));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(
                            0xFFFEBC52,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
