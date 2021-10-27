// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:postbird/Screens/Guidepage.dart';
// import 'package:postbird/Screens/ManualInputTrack.dart';
// import 'package:postbird/Screens/inbox.dart';
// import 'package:postbird/Screens/account.dart';
// import 'package:postbird/Screens/My Activity.dart';
// import 'package:postbird/ui/views/profile/views/profile_view.dart';

// class HomePage2 extends StatefulWidget {
//   @override
//   _HomePage2State createState() => _HomePage2State();
// }

// class _HomePage2State extends State<HomePage2> {
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.orangeAccent,
//       body: SafeArea(
//         child: Container(
//           child: Stack(
//             children: [
//               Positioned(
//                 top: screenHeight * 0.03,
//                 left: screenWidth * 0.4,
//                 child: Container(
//                   width: 80,
//                   height: 80,
//                   child: Image(
//                     image: AssetImage('assets/group2.png'),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: screenHeight * 0.2,
//                 child: Container(
//                   width: screenWidth,
//                   height: screenHeight,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(24),
//                       topRight: Radius.circular(24),
//                     ),
//                     color: Colors.white,
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: screenHeight * 0.14,
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 10, right: 10),
//                               child: Container(
//                                 width: screenWidth * 0.96,
//                                 height: 90,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                 ),
//                                 child: Stack(
//                                   children: <Widget>[
//                                     Positioned(
//                                         top: 0,
//                                         left: 0,
//                                         child: Container(
//                                             width: screenWidth * 0.92,
//                                             height: 90,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.only(
//                                                 topLeft: Radius.circular(12),
//                                                 topRight: Radius.circular(12),
//                                                 bottomLeft: Radius.circular(12),
//                                                 bottomRight:
//                                                     Radius.circular(12),
//                                               ),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     color: Color.fromRGBO(0, 0,
//                                                         0, 0.07999999821186066),
//                                                     offset: Offset(0, 18),
//                                                     blurRadius: 40)
//                                               ],
//                                               color: Colors.white,
//                                             ))),
//                                     Positioned(
//                                         top: 29,
//                                         left: screenWidth * 0.65,
//                                         child: Container(
//                                             width: 84,
//                                             height: 32,
//                                             decoration: BoxDecoration(
//                                               color: Color.fromRGBO(
//                                                   255, 255, 255, 1),
//                                             ),
//                                             child: Stack(children: <Widget>[
//                                               Positioned(
//                                                   top: 0,
//                                                   left: 0,
//                                                   child: Container(
//                                                     width: 84,
//                                                     height: 32,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                         topLeft:
//                                                             Radius.circular(10),
//                                                         topRight:
//                                                             Radius.circular(10),
//                                                         bottomLeft:
//                                                             Radius.circular(10),
//                                                         bottomRight:
//                                                             Radius.circular(10),
//                                                       ),
//                                                       color: Color.fromRGBO(
//                                                           255, 255, 255, 1),
//                                                       border: Border.all(
//                                                         color: Color.fromRGBO(
//                                                             254, 188, 82, 1),
//                                                         width: 1,
//                                                       ),
//                                                     ),
//                                                   )),
//                                               Positioned(
//                                                   top: 10,
//                                                   left: 20,
//                                                   child: Text(
//                                                     'Track',
//                                                     textAlign: TextAlign.center,
//                                                     style: GoogleFonts.manrope(
//                                                         color: Color.fromRGBO(
//                                                             0,
//                                                             0,
//                                                             0,
//                                                             0.6000000238418579),
//                                                         fontSize: 14,
//                                                         letterSpacing: 0,
//                                                         fontWeight:
//                                                             FontWeight.normal,
//                                                         height: 1),
//                                                   )),
//                                             ]))),
//                                     Positioned(
//                                         top: 9,
//                                         left: screenWidth * 0.04,
//                                         child: Text(
//                                           'PostBird is delivering your package',
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.manrope(
//                                               color: Color.fromRGBO(
//                                                   0, 0, 0, 0.6000000238418579),
//                                               fontSize: 14,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.w400,
//                                               height: 1),
//                                         )),
//                                     Positioned(
//                                         top: 62,
//                                         left: 158,
//                                         child: Text(
//                                           'ETA 02:12 PM',
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.manrope(
//                                               color: Color.fromRGBO(
//                                                   0, 0, 0, 0.3499999940395355),
//                                               fontSize: 10,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.w400,
//                                               height: 1),
//                                         )),
//                                     Positioned(
//                                         top: 62,
//                                         left: 14,
//                                         child: Text(
//                                           'David',
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.manrope(
//                                               color: Color.fromRGBO(
//                                                   0, 0, 0, 0.3499999940395355),
//                                               fontSize: 10,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.w400,
//                                               height: 1),
//                                         )),
//                                     Positioned(
//                                       top: 44,
//                                       left: 14,
//                                       child: Container(
//                                         width: 205,
//                                         height: 14,
//                                         decoration: BoxDecoration(
//                                           color:
//                                               Color.fromRGBO(255, 255, 255, 1),
//                                         ),
//                                         child: Stack(
//                                           children: <Widget>[
//                                             Positioned(
//                                                 top: 5,
//                                                 left: 0,
//                                                 child: Container(
//                                                     width: 205,
//                                                     height: 6,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                         topLeft:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                         topRight:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                         bottomLeft:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                         bottomRight:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                       ),
//                                                       color: Color.fromRGBO(
//                                                           255,
//                                                           255,
//                                                           255,
//                                                           0.7599999904632568),
//                                                     ))),
//                                             Positioned(
//                                                 top: 5,
//                                                 left: 0,
//                                                 child: Container(
//                                                     width: 100,
//                                                     height: 6,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                         topLeft:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                         topRight:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                         bottomLeft:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                         bottomRight:
//                                                             Radius.circular(
//                                                                 2.5),
//                                                       ),
//                                                       gradient: LinearGradient(
//                                                           begin: Alignment(
//                                                               -2.1872713565826416,
//                                                               0),
//                                                           end: Alignment(0,
//                                                               -2.1872713565826416),
//                                                           colors: [
//                                                             Color.fromRGBO(
//                                                                 180,
//                                                                 176,
//                                                                 254,
//                                                                 0.6700000166893005),
//                                                             Color.fromRGBO(
//                                                                 152,
//                                                                 147,
//                                                                 244,
//                                                                 0.6700000166893005)
//                                                           ]),
//                                                     ))),
//                                             Positioned(
//                                               top: 0,
//                                               left: 93,
//                                               child: Container(
//                                                   width: 14,
//                                                   height: 14,
//                                                   decoration: BoxDecoration(
//                                                     color: Color.fromRGBO(
//                                                         255, 255, 255, 1),
//                                                   ),
//                                                   child:
//                                                       Stack(children: <Widget>[
//                                                     Positioned(
//                                                         top: 1.3378305435180664,
//                                                         left: 0.679410457611084,
//                                                         child: Image(
//                                                           width: 15,
//                                                           height: 13,
//                                                           image: AssetImage(
//                                                             'assets/Path.png',
//                                                           ),
//                                                         )),
//                                                   ])),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         left: screenWidth * 0.2,
//                         top: screenHeight * 0.3,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(28.0, 70, 28, 30),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.orangeAccent,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(8),
//                                 topRight: Radius.circular(8),
//                                 bottomLeft: Radius.circular(8),
//                                 bottomRight: Radius.circular(8),
//                               ),
//                             ),
//                             child: FlatButton(
//                                 //color: Colors.grey[600],
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => Guidepage()));
//                                 },
//                                 child: Text(
//                                   'Send Package',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Manrope',
//                                     fontSize: 20,
//                                     letterSpacing: 0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 )),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: screenHeight * 0.5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: screenWidth * 0.96,
//                             decoration: BoxDecoration(
//                               color: Color(0xFFFBD351),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 right: 0,
//                                 left: 20,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: screenHeight * 0.04,
//                                       ),
//                                       Text(
//                                         'PostBird Business',
//                                         textAlign: TextAlign.left,
//                                         style: GoogleFonts.manrope(
//                                             color: Color.fromRGBO(
//                                                 0, 0, 0, 0.6000000238418579),
//                                             fontSize: 14,
//                                             letterSpacing: 0,
//                                             fontWeight: FontWeight.w700,
//                                             height: 1),
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Text(
//                                         'We can help your business',
//                                         textAlign: TextAlign.left,
//                                         style: GoogleFonts.manrope(
//                                             color: Color.fromRGBO(
//                                                 0, 0, 0, 0.3499999940395355),
//                                             fontSize: 12,
//                                             letterSpacing: 0,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: screenWidth * 0.1,
//                                   ),
//                                   Image(
//                                     height: screenHeight * 0.15,
//                                     width: screenWidth * 0.3,
//                                     image: AssetImage(
//                                       'assets/box.png',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: screenHeight * 0.16,
//                 left: screenWidth * 0.03,
//                 right: screenWidth * 0.03,
//                 child: Container(
//                   width: screenWidth,
//                   height: screenHeight * 0.14,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey[200]!,
//                         blurRadius: 15.0, // soften the shadow
//                         spreadRadius: 5.0, //extend the shadow
//                         offset: Offset(
//                           10.0, // Move to right 10  horizontally
//                           10.0, // Move to bottom 10 Vertically
//                         ),
//                       )
//                     ],
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       topRight: Radius.circular(12),
//                       bottomLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12),
//                     ),
//                     color: Colors.white,
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: screenHeight * 0.02,
//                         left: screenWidth * 0.03,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(
//                               Icons.lock_clock,
//                               color: Colors.orangeAccent,
//                             ),
//                             Text(
//                               'TopUp Credit',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontFamily: 'Manrope',
//                                   fontSize: 15,
//                                   letterSpacing: 0,
//                                   fontWeight: FontWeight.bold,
//                                   height: 1),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: screenHeight * 0.07,
//                         left: screenWidth * 0.03,
//                         child: Text(
//                           '5000 credits',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Manrope',
//                               fontSize: 17,
//                               letterSpacing: 0,
//                               fontWeight: FontWeight.bold,
//                               height: 1),
//                         ),
//                       ),
//                       Positioned(
//                         top: screenHeight * 0.03,
//                         left: screenWidth * 0.43,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               topRight: Radius.circular(8),
//                               bottomLeft: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                             ),
//                             border: Border.all(
//                               color: Colors.black38,
//                               width: 1,
//                             ),
//                           ),
//                           child: FlatButton.icon(
//                               color: Colors.white70,
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => TrackPackage1()));
//                               },
//                               icon: Icon(
//                                 Icons.edit,
//                                 color: Colors.orangeAccent,
//                                 size: 20,
//                               ),
//                               label: Text(
//                                 'Track Order',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontFamily: 'Manrope',
//                                   fontSize: 20,
//                                   letterSpacing: 0,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Navbar2 extends StatefulWidget {
//   final name;
//   final ids;
//   const Navbar2({Key? key, this.name, this.ids}) : super(key: key);
//   // const AddfundPage({Key key, this.amount, this.wallty}) : super(key: key);

//   @override
//   _Navbar2State createState() => _Navbar2State();
// }

// class _Navbar2State extends State<Navbar2> {
//   int currentIndex = 0;
//   final List<Widget> _children = [HomePage2(), Activity(), Inbox(), ProfileView()];

//   void onTappedBar(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTappedBar,
//         currentIndex: currentIndex,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.orangeAccent,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             title: Text(
//               'Home',
//               style: TextStyle(
//                   fontFamily: 'Manrope',
//                   fontSize: 16,
//                   letterSpacing: 0,
//                   fontWeight: FontWeight.bold,
//                   height: 1),
//             ),
//             icon: Icon(
//               Icons.home_outlined,
//             ),
//           ),
//           BottomNavigationBarItem(
//             title: Text(
//               'Activity',
//               style: TextStyle(
//                   fontFamily: 'Manrope',
//                   fontSize: 16,
//                   letterSpacing: 0,
//                   fontWeight: FontWeight.bold,
//                   height: 1),
//             ),
//             icon: Icon(
//               Icons.all_inbox,
//             ),
//           ),
//           BottomNavigationBarItem(
//             title: Text(
//               'Chat',
//               style: TextStyle(
//                   fontFamily: 'Manrope',
//                   fontSize: 16,
//                   letterSpacing: 0,
//                   fontWeight: FontWeight.bold,
//                   height: 1),
//             ),
//             icon: Icon(
//               Icons.message_outlined,
//             ),
//           ),
//           BottomNavigationBarItem(
//             title: Text(
//               'Me',
//               style: TextStyle(
//                   fontFamily: 'Manrope',
//                   fontSize: 16,
//                   letterSpacing: 0,
//                   fontWeight: FontWeight.bold,
//                   height: 1),
//             ),
//             icon: Icon(
//               Icons.person_outlined,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
