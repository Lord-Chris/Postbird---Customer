// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:postbird/Screens/Finding Courier.dart';
// import 'package:postbird/Screens/strings.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class FindingDriver extends StatefulWidget {
//   final name;
//   final fromPlaceDetail;
//   final toPlaceDetail;
//   final polylines;
//   final polylineCoordinates;
//   final stname;
//   final dtname;
//   final frmlt;
//   final frmlg;
//   final tolt;
//   final tolg;
//   final date;
//   final sendernumber;
//   final notess;
//   final recnumber;
//   final recname;
//   final recnote;
//   final zipcode;
//   final credits;
//   final type;
//   final fragile;
//   final packagename;
//   final packsize;
//   final userid;
//   const FindingDriver({
//     Key? key,
//     this.name,
//     this.fromPlaceDetail,
//     this.toPlaceDetail,
//     this.polylines,
//     this.polylineCoordinates,
//     this.stname,
//     this.dtname,
//     this.frmlt,
//     this.frmlg,
//     this.tolt,
//     this.date,
//     this.tolg,
//     this.sendernumber,
//     this.notess,
//     this.recnumber,
//     this.recname,
//     this.recnote,
//     this.zipcode,
//     this.credits,
//     this.type,
//     this.fragile,
//     this.packagename,
//     this.packsize,
//     this.userid,
//   });
//   @override
//   _FindingDriverState createState() => _FindingDriverState();
// }

// class _FindingDriverState extends State<FindingDriver> {
//   Timer? _timer;
//   int _start = 60;
//   void startTimer() {
//     const oneSec = const Duration(seconds: 1);
//     _timer = new Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (_start == 0) {
//           setState(() {
//             timer.cancel();
//           });
//           Navigator.pop(context);
//         } else {
//           setState(() {
//             _start--;
//           });
//         }
//       },
//     );
//   }

//   proccessOrder() async {
//     var ad = Strings.BASE_URL + 'proccessorder';
//     var from = widget.fromPlaceDetail.toString();
//     var to = widget.toPlaceDetail.toString();
//     print(widget.userid);
//     var response = await http.post(Uri.parse(ad), headers: {
//       "accept": "application/json"
//     }, body: {
//       "sname": widget.name,
//       "spaddress": widget.fromPlaceDetail.toString(),
//       "sphone": widget.sendernumber.toString(),
//       "stype": widget.type.toString(),
//       "packagesize": widget.packsize.toString(),
//       "spdetails": widget.notess.toString(),
//       "spfragile": widget.fragile.toString(),
//       "userid": widget.userid.toString(),
//       "ranem": widget.recname.toString(),
//       "rpaddress": widget.toPlaceDetail.toString(),
//       "rpostal": widget.zipcode.toString(),
//       "rphone": widget.recnumber.toString(),
//       "radnote": widget.notess.toString(),
//       "credits": widget.credits.toString(),
//       "date": widget.date.toString(),
//       "packagename": widget.packagename.toString(),
//       "frmlt": widget.frmlt.toString(),
//       "tolt": widget.tolt.toString(),
//       "frmlg": widget.frmlg.toString(),
//       "tolg": widget.tolg.toString(),
//     });

//     final data = jsonDecode(response.body);
//     print(data);
//     // var stat = data['data'].toString();
//     // var messg = data['message'];
//     print(data);
//     // var stat = data['data'];
//     // return stat;
//     // if (stat == true) {
//     //   // topUp();
//     // } else if (stat == false) {
//     //   Toast.show(messg, context,
//     //       duration: Toast.LENGTH_LONG,
//     //       backgroundColor: Colors.green,
//     //       textColor: Colors.white,
//     //       gravity: Toast.TOP);
//     //   Navigator.pop(context);
//     // }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//     proccessOrder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // proccessOrder();
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;

//     return Material(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/Maps.png'),
//           ),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//                 top: screenHeight * 0.3,
//                 left: screenWidth * 0.3,
//                 child: Container(
//                     width: 170,
//                     height: 170,
//                     child: Image(
//                       image: AssetImage('assets/Group3.png'),
//                     ))),
//             Positioned(
//                 top: screenHeight * 0.3,
//                 left: screenWidth * 0.1,
//                 child: Container(
//                     width: 32,
//                     height: 32,
//                     child: Stack(children: <Widget>[
//                       Positioned(
//                           top: 1.8055963516235352,
//                           left: 0.23551763594150543,
//                           child: RotationTransition(
//                             turns: new AlwaysStoppedAnimation(15 / 360),
//                             child: Image(
//                               image: AssetImage('assets/Courier.png'),
//                             ),
//                           )),
//                     ]))),
//             Positioned(
//                 top: screenHeight * 0.23,
//                 left: screenWidth * 0.65,
//                 child: Container(
//                     width: 32,
//                     height: 32,
//                     child: Stack(children: <Widget>[
//                       Positioned(
//                           top: 1.8055963516235352,
//                           left: 0.23551763594150543,
//                           child: RotationTransition(
//                             turns: new AlwaysStoppedAnimation(15 / 360),
//                             child: Image(
//                               image: AssetImage('assets/Courier.png'),
//                             ),
//                           )),
//                     ]))),
//             Positioned(
//                 top: screenHeight * 0.46,
//                 left: screenWidth * 0.77,
//                 child: Container(
//                     width: 32,
//                     height: 32,
//                     child: Stack(children: <Widget>[
//                       Positioned(
//                           top: 1.8055963516235352,
//                           left: 0.23551763594150543,
//                           child: RotationTransition(
//                             turns: new AlwaysStoppedAnimation(15 / 360),
//                             child: Image(
//                               image: AssetImage('assets/Courier.png'),
//                             ),
//                           )),
//                     ]))),
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight * 0.53),
//               child: Container(
//                   child: Stack(children: <Widget>[
//                 Positioned(
//                     top: 0,
//                     left: 0,
//                     child: Container(
//                         width: screenWidth,
//                         height: screenHeight * 0.2,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(24),
//                             topRight: Radius.circular(24),
//                             bottomLeft: Radius.circular(0),
//                             bottomRight: Radius.circular(0),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Color.fromRGBO(
//                                     0, 0, 0, 0.07999999821186066),
//                                 offset: Offset(0, 18),
//                                 blurRadius: 40)
//                           ],
//                           color: Color.fromRGBO(254, 188, 82, 1),
//                         ))),
//                 Positioned(
//                     top: 15,
//                     left: screenWidth * 0.08,
//                     child: Text(
//                       'Wait, your courier will come on',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(255, 255, 255, 1),
//                           fontFamily: 'Manrope',
//                           fontSize: 14,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.normal,
//                           height: 1),
//                     )),
//                 Positioned(
//                     top: 15,
//                     left: screenWidth * 0.85,
//                     child: Text(
//                       ' $_start s',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(255, 255, 255, 1),
//                           fontFamily: 'Manrope',
//                           fontSize: 14,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.normal,
//                           height: 1),
//                     )),
//                 Positioned(
//                     top: 40,
//                     left: 0,
//                     child: Container(
//                         width: screenWidth,
//                         height: screenHeight * 0.427,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(24),
//                             topRight: Radius.circular(24),
//                             bottomLeft: Radius.circular(0),
//                             bottomRight: Radius.circular(0),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Color.fromRGBO(
//                                     0, 0, 0, 0.07999999821186066),
//                                 offset: Offset(0, 18),
//                                 blurRadius: 40)
//                           ],
//                           color: Color.fromRGBO(250, 250, 250, 1),
//                         ))),
//                 Positioned(
//                     top: screenHeight * 0.27,
//                     left: screenWidth * 0.33,
//                     child: Text(
//                       'Finding Courier',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color.fromRGBO(0, 0, 0, 0.8999999761581421),
//                           fontFamily: 'Manrope',
//                           fontSize: 18,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.normal,
//                           height: 1),
//                     )),
//                 Positioned(
//                     top: screenHeight * 0.31,
//                     left: screenWidth * 0.16,
//                     child: Text(
//                       'A  Courier will pick up your package soon.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
//                           fontFamily: 'Manrope',
//                           fontSize: 14,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.normal,
//                           height: 1),
//                     )),
//                 Positioned(
//                     top: screenHeight * 0.35,
//                     left: screenWidth * 0.1,
//                     child: Container(
//                         width: 304,
//                         height: 56,
//                         decoration: BoxDecoration(
//                           color: Color.fromRGBO(255, 255, 255, 1),
//                         ),
//                         child: Stack(children: <Widget>[
//                           // Positioned(
//                           //     top: 0,
//                           //     left: 0,
//                           //     child: Container(
//                           //         width: 304,
//                           //         height: 56,
//                           //         decoration: BoxDecoration(
//                           //           borderRadius : BorderRadius.only(
//                           //             topLeft: Radius.circular(8),
//                           //             topRight: Radius.circular(8),
//                           //             bottomLeft: Radius.circular(8),
//                           //             bottomRight: Radius.circular(8),
//                           //           ),
//                           //           color : Color.fromRGBO(255, 255, 255, 1),
//                           //           border : Border.all(
//                           //             color: Color.fromRGBO(222, 222, 222, 1),
//                           //             width: 1,
//                           //           ),
//                           //         )
//                           //     )
//                           // ),
//                           Positioned(
//                               top: 0,
//                               left: 0,
//                               child: Container(
//                                   width: 304,
//                                   height: 56,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(8),
//                                         topRight: Radius.circular(8),
//                                         bottomLeft: Radius.circular(8),
//                                         bottomRight: Radius.circular(8),
//                                       ),
//                                       border: Border.all(
//                                         color: Colors.grey[400]!,
//                                       )))),
//                           Positioned(
//                               top: 16,
//                               left: 123.44999694824219,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               FindingCourier()));
//                                 },
//                                 child: Text(
//                                   'Cancel',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(27, 27, 27, 1),
//                                       fontFamily: 'Manrope',
//                                       fontSize: 18,
//                                       letterSpacing: 0,
//                                       fontWeight: FontWeight.bold,
//                                       height: 1),
//                                 ),
//                               )),
//                         ]))),
//                 Positioned(
//                     top: screenHeight * 0.12,
//                     left: screenWidth * 0.35,
//                     child: Container(
//                         width: 102,
//                         height: 91,
//                         child: Stack(children: <Widget>[
//                           Positioned(
//                               top: 0,
//                               left: 0,
//                               child: Container(
//                                 width: 102.00020599365234,
//                                 height: 91.00017547607422,
//                                 child: Image(
//                                   image: AssetImage('assets/anim.gif'),
//                                 ),
//                               )),
//                         ]))),
//               ])),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
