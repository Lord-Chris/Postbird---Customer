// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:postbird/Screens/ShipmentStart.dart';

// class Guidepage extends StatefulWidget {
//   final name;
//   final ids;
//   const Guidepage({Key? key, this.name, this.ids}) : super(key: key);

//   @override
//   _GuidepageState createState() => _GuidepageState();
// }

// class _GuidepageState extends State<Guidepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//         child: Container(
//           padding: EdgeInsets.only(top: 240),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               colorFilter: ColorFilter.mode(Colors.grey, BlendMode.difference),
//               image: AssetImage('assets/Maps.png'),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 15, 10, 10),
//                 child: Container(
//                   width: 343,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       topRight: Radius.circular(8),
//                       bottomLeft: Radius.circular(8),
//                       bottomRight: Radius.circular(8),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
//                           offset: Offset(0, 18),
//                           blurRadius: 40)
//                     ],
//                     color: Color.fromRGBO(250, 250, 250, 1),
//                   ),
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         top: 0,
//                         left: 16,
//                         child: Container(
//                           width: 343,
//                           height: 189,
//                           child: Stack(
//                             children: <Widget>[
//                               Positioned(
//                                   top: 10,
//                                   left: 0,
//                                   child: // Figma Flutter Generator 14Widget - TEXT
//                                       Text(
//                                     '1/4',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         fontFamily: 'Manrope',
//                                         fontSize: 17,
//                                         letterSpacing: 0,
//                                         fontWeight: FontWeight.normal,
//                                         height: 1),
//                                   )),
//                               Positioned(
//                                 top: 40,
//                                 left: 0,
//                                 child: Text(
//                                   'Start by placing your order here.',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontFamily: 'Manrope',
//                                       fontSize: 22,
//                                       letterSpacing: 0,
//                                       fontWeight: FontWeight.bold,
//                                       height: 1),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 75,
//                                 child: Container(
//                                   width: 330,
//                                   child: Text(
//                                     'We believe that a connected world is a better world, and that belief guides.',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         color: Colors.grey[600],
//                                         fontFamily: 'Manrope',
//                                         fontSize: 18,
//                                         letterSpacing: 0,
//                                         fontWeight: FontWeight.normal,
//                                         height: 1),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 150,
//                                 left: 0,
//                                 child: Container(
//                                   width: 80,
//                                   height: 32,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(6),
//                                       topRight: Radius.circular(6),
//                                       bottomLeft: Radius.circular(6),
//                                       bottomRight: Radius.circular(6),
//                                     ),
//                                     color: Colors.white12,
//                                   ),
//                                   child: FlatButton(
//                                     onPressed: null,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ShipmentStart()));
//                                       },
//                                       child: Text(
//                                         'Skip',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontFamily: 'Manrope',
//                                             fontSize: 18,
//                                             letterSpacing: 0,
//                                             fontWeight: FontWeight.normal,
//                                             height: 1),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 150,
//                                 left: 220,
//                                 child: Container(
//                                   width: 80,
//                                   height: 35,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(6),
//                                       topRight: Radius.circular(6),
//                                       bottomLeft: Radius.circular(6),
//                                       bottomRight: Radius.circular(6),
//                                     ),
//                                     color: Colors.orangeAccent,
//                                   ),
//                                   child: FlatButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   ShipmentStart()));
//                                     },
//                                     child: Text(
//                                       'Next',
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: 'Manrope',
//                                           fontSize: 18,
//                                           letterSpacing: 0,
//                                           fontWeight: FontWeight.normal,
//                                           height: 1),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 15, 10, 25),
//                 child: Container(
//                     width: 343,
//                     height: 153,
//                     child: Stack(children: <Widget>[
//                       Positioned(
//                         top: 0,
//                         left: 0,
//                         child: Container(
//                           width: 343,
//                           height: 153,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               topRight: Radius.circular(8),
//                               bottomLeft: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Color.fromRGBO(
//                                       0, 0, 0, 0.07999999821186066),
//                                   offset: Offset(0, 18),
//                                   blurRadius: 40)
//                             ],
//                             color: Color.fromRGBO(250, 250, 250, 1),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           top: 53,
//                           left: 8,
//                           child: Container(
//                               width: 327,
//                               height: 46,
//                               decoration: BoxDecoration(
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                               ),
//                               child: Stack(children: <Widget>[
//                                 Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: Container(
//                                         width: 327,
//                                         height: 46,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(8),
//                                             topRight: Radius.circular(8),
//                                             bottomLeft: Radius.circular(8),
//                                             bottomRight: Radius.circular(8),
//                                           ),
//                                           color: Color.fromRGBO(255, 255, 255,
//                                               0.00009999999747378752),
//                                         ))),
//                                 Positioned(
//                                   top: 13,
//                                   left: 16,
//                                   child: Image(
//                                     image: AssetImage('assets/Path.png'),
//                                   ),
//                                 ),
//                                 Positioned(
//                                     top: 12,
//                                     left: 52,
//                                     child: Text(
//                                       '24 Adetokunbo Ademola Str...',
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                           color: Color.fromRGBO(27, 27, 27, 1),
//                                           fontFamily: 'Manrope',
//                                           fontSize: 19,
//                                           letterSpacing: 0,
//                                           fontWeight: FontWeight.bold,
//                                           height: 1),
//                                     )),
//                               ]))),
//                       Positioned(
//                           top: 8,
//                           left: 8,
//                           child: Container(
//                               width: 327,
//                               height: 46,
//                               decoration: BoxDecoration(
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                               ),
//                               child: Stack(children: <Widget>[
//                                 Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: Container(
//                                         width: 327,
//                                         height: 46,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(8),
//                                             topRight: Radius.circular(8),
//                                             bottomLeft: Radius.circular(8),
//                                             bottomRight: Radius.circular(8),
//                                           ),
//                                           color: Color.fromRGBO(255, 255, 255,
//                                               0.00009999999747378752),
//                                         ))),
//                                 Positioned(
//                                   top: 13,
//                                   left: 16,
//                                   child: Image(
//                                     image: AssetImage('assets/clock.png'),
//                                   ),
//                                 ),
//                                 Positioned(
//                                     top: 12,
//                                     left: 52,
//                                     child: Text(
//                                       'Select Date',
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontFamily: 'Manrope',
//                                           fontSize: 16,
//                                           letterSpacing: 0,
//                                           fontWeight: FontWeight.normal,
//                                           height: 1),
//                                     )),
//                               ]))),
//                       Positioned(
//                           top: 99,
//                           left: 8,
//                           child: Container(
//                               width: 327,
//                               height: 46,
//                               decoration: BoxDecoration(
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                               ),
//                               child: Stack(children: <Widget>[
//                                 Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: Container(
//                                         width: 327,
//                                         height: 46,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(8),
//                                             topRight: Radius.circular(8),
//                                             bottomLeft: Radius.circular(8),
//                                             bottomRight: Radius.circular(8),
//                                           ),
//                                           color: Color.fromRGBO(255, 255, 255,
//                                               0.00009999999747378752),
//                                         ))),
//                                 Positioned(
//                                     top: 13,
//                                     left: 16,
//                                     child: Container(
//                                         width: 20.44871711730957,
//                                         height: 20,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(20),
//                                             topRight: Radius.circular(20),
//                                             bottomLeft: Radius.circular(20),
//                                             bottomRight: Radius.circular(20),
//                                           ),
//                                           color:
//                                               Color.fromRGBO(125, 224, 200, 1),
//                                         ))),
//                                 Positioned(
//                                     top: 12,
//                                     left: 52,
//                                     child: Text(
//                                       'Put Destination',
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontFamily: 'Manrope',
//                                           fontSize: 16,
//                                           letterSpacing: 0,
//                                           fontWeight: FontWeight.normal,
//                                           height: 1),
//                                     )),
//                               ]))),
//                       Positioned(
//                           top: 98,
//                           left: 60,
//                           child: Container(
//                               width: 267,
//                               height: 1,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                               ))),
//                       Positioned(
//                           top: 53,
//                           left: 60,
//                           child: Container(
//                               width: 267,
//                               height: 1,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                               ))),
//                       Positioned(
//                         top: 92,
//                         left: 32.5,
//                         child: Image(
//                           image: AssetImage('assets/Line.png'),
//                         ),
//                       ),
//                       Positioned(
//                         top: 46,
//                         left: 32.5,
//                         child: Image(
//                           image: AssetImage('assets/Line.png'),
//                         ),
//                       ),
//                     ])),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
