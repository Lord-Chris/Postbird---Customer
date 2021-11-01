// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:postbird/Screens/Chat.dart';

// import 'package:http/http.dart' as http;
// import 'package:postbird/Screens/account.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:postbird/Screens/strings.dart';
// import 'dart:convert';
// import 'dart:async';

// class Inbox extends StatefulWidget {
//   @override
//   _InboxState createState() => _InboxState();
// }

// class _InboxState extends State<Inbox> {
//   String id = "",
//       email = "",
//       fullname = "",
//       password = "",
//       token = "",
//       userRef = "",
//       reply = "",
//       recipRef = "",
//       unReadMsg = "";
//   List conversations = [];
//   getPref() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       id = preferences.getString("id")!;
//       email = preferences.getString("email")!;
//       fullname = preferences.getString("name")!;
//       password = preferences.getString('pwd')!;
//       var t = preferences.getString("token");
//       token = 'Bearer ' + t!;
//       userRef = preferences.getString("userRef")!;
//     });
//     print('email: ' + email);
//     print('ID: ' + id);
//     print('name: ' + fullname.toString());
//     print('token: ' + token);
//     print('user: ' + userRef);

//     Timer(Duration(seconds: 3), () => fetchConversations());
//     Timer(Duration(seconds: 3), () => fetchNotifications());

//     Timer.periodic(new Duration(seconds: 5), (timer) {
//       fetchConversations();
//       fetchNotifications();
//     });
//   }

//   fetchConversations() async {
//     final response = await http.post(Uri.parse("https://k-dev.org/postbird/"),
//         headers: {"Authorization": token}, body: {"user": userRef});
//     final reqData = jsonDecode(response.body);
//     if (reqData['done'] == true) {
//       print(reqData);
//       // setState(() {
//       //   conversations = reqData['data']['reply'];
//       // });
//       var dat = reqData['data'];
//       for (var i = 0; i < dat.length; i++) {
//         var lastMsg = dat[i]['mes'];
//         var userid = dat[i]['user_id'];
//         var uid = userid.toString();
//         var date = dat[i]['date'];
//         var color = dat[i]['unread'].toString();
//         var unr = dat[i]['unr'];
//         var recipRef = dat[i]['user_ref'];
//         final response = await http
//             .get(Uri.parse("http://api.postbird.com.ng/api/getuser/" + uid));
//         final row = jsonDecode(response.body);
//         print("user details");
//         print(row);
//         if (row['success'] == true) {
//           var c = [];
//           var conv = {
//             'name': row['data'][0]['name'],
//             'pic': row['data'][0]['profilepic'],
//             'msg': lastMsg,
//             'date': date,
//             'recipRef': recipRef,
//             'colorB': color,
//             'unr': unr
//           };
//           c.add(conv);
//           print(conv['color']);
//           Timer(
//               Duration(seconds: 3),
//               () => setState(() {
//                     conversations = c;
//                   }));
//           // print(conversations);
//         }
//         // print(row);
//       }
//     }
//     print("converstiongn");
//     // print(reqData);
//     // print(userRef);
//   }

//   fetchNotifications() async {
//     final response = await http.post(
//         Uri.parse("https://k-dev.org/postbird/notif/"),
//         headers: {"Authorization": token},
//         body: {"user": userRef});
//     final reqData = jsonDecode(response.body);
//     if (reqData['done'] == true) {
//       var msg = reqData['msg'] + " " + " messages";
//       setState(() {
//         unReadMsg = msg;
//       });
//     }
//     print("notification");
//     // print(reqData);
//     // print(userRef);
//   }

//   ScrollController controller = new ScrollController();

//   @override
//   void initState() {
//     getPref();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color(
//         0xFFFEBC52,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 30,
//                 bottom: 20,
//               ),
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Text(
//                       'Inbox',
//                       style: GoogleFonts.manrope(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18,
//                         color: Color(
//                           0xFFFFFFFF,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 30,
//                     child: Icon(
//                       Icons.notifications_outlined,
//                       size: 24,
//                       color: Color(
//                         0xFFFAFAFA,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: screenWidth,
//                 // height:screenHeight,
//                 decoration: BoxDecoration(
//                   color: Color(
//                     0xFFFFFFFF,
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(50),
//                     topLeft: Radius.circular(50),
//                   ),
//                 ),
//                 padding: EdgeInsets.only(
//                   top: 40,
//                 ),
//                 child: ListView(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         right: 20,
//                         left: 20,
//                       ),
//                       child: Text(
//                         // unReadMsg+' new messages',
//                         unReadMsg,
//                         style: GoogleFonts.manrope(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14,
//                           color: Color(
//                             0xFF000000,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Container(
//                         padding: EdgeInsets.only(
//                           right: 20,
//                           left: 20,
//                           top: 20,
//                         ),
//                         width: double.infinity,
//                         child:
//                             Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                 // liest view
//                                 children: [
//                               // Container(
//                               SizedBox(
//                                   height: 450,
//                                   child: ListView(
//                                     controller: controller,
//                                     scrollDirection: Axis.vertical,
//                                     physics: ScrollPhysics(),
//                                     shrinkWrap: true,
//                                     children: conversations
//                                         .asMap()
//                                         .entries
//                                         .map((item) => Padding(
//                                             padding: const EdgeInsets.only(
//                                               left: 0,
//                                               right: 0,
//                                             ),
//                                             child: Column(children: <Widget>[
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   // Navigator.push(context,
//                                                   // MaterialPageRoute(builder: (context) => Chat(),
//                                                   //     settings: RouteSettings(
//                                                   //       arguments: [{'userRef': userRef, 'recipRef': conversations[item.key]['recipRef'], 'profilePic': conversations[item.key]['pic'],  'name': conversations[item.key]['name']}],
//                                                   //     ),
//                                                   //   ),
//                                                   // );
//                                                 },
//                                                 child: Slidable(
//                                                   actionPane:
//                                                       SlidableDrawerActionPane(),
//                                                   actionExtentRatio: 0.25,
//                                                   secondaryActions: [
//                                                     Padding(
//                                                       padding: const EdgeInsets
//                                                           .symmetric(
//                                                         horizontal: 20,
//                                                       ),
//                                                       child: Container(
//                                                         height: 100,
//                                                         width: 20,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Color(
//                                                             0xFFFEBC52,
//                                                           ),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(5),
//                                                         ),
//                                                         child: Center(
//                                                           child: Icon(
//                                                             Icons
//                                                                 .delete_outline,
//                                                             color: Color(
//                                                               0xFFFFFFFF,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                   child: Container(
//                                                     width: double.infinity,
//                                                     height: 100,
//                                                     padding: EdgeInsets.only(
//                                                       right: 20,
//                                                       left: 20,
//                                                       top: 10,
//                                                       bottom: 10,
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.grey[50],
//                                                       // border: Border.all(color: Color( conversations[item.key]['colorB'], )),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                     ),
//                                                     child: Stack(
//                                                       alignment:
//                                                           AlignmentDirectional
//                                                               .topStart,
//                                                       children: [
//                                                         Positioned(
//                                                           right: 0,
//                                                           child: Text(
//                                                             conversations[item
//                                                                 .key]['date'],
//                                                             style: GoogleFonts
//                                                                 .manrope(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600,
//                                                               fontSize: 10,
//                                                               color: Color(
//                                                                 0xFF000000,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         Row(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                       .all(0),
//                                                               child:
//                                                                   CircleAvatar(
//                                                                 radius: 15,
//                                                                 backgroundImage:
//                                                                     NetworkImage(
//                                                                   'https://api.postbird.com.ng/public/img/profile/' +
//                                                                       conversations[
//                                                                               item.key]
//                                                                           [
//                                                                           'pic'],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 15,
//                                                             ),
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   'User',
//                                                                   style: GoogleFonts
//                                                                       .manrope(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         10,
//                                                                     // color: Color(
//                                                                     //  conversations[item.key],
//                                                                     // ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 3,
//                                                                 ),
//                                                                 Text(
//                                                                   conversations[
//                                                                           item.key]
//                                                                       ['name'],
//                                                                   style: GoogleFonts
//                                                                       .manrope(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w700,
//                                                                     fontSize:
//                                                                         14,
//                                                                     color:
//                                                                         Color(
//                                                                       0xFF000000,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 conversations[item.key]
//                                                                             [
//                                                                             'unr'] ==
//                                                                         1
//                                                                     ? Text(
//                                                                         conversations[item.key]['msg'] +
//                                                                             "[un read]",
//                                                                         style: GoogleFonts
//                                                                             .manrope(
//                                                                           fontWeight:
//                                                                               FontWeight.w700,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               Color(
//                                                                             0xFF0AC917,
//                                                                           ),
//                                                                         ),
//                                                                       )
//                                                                     : Text(
//                                                                         conversations[item.key]
//                                                                             [
//                                                                             'msg'],
//                                                                         style: GoogleFonts
//                                                                             .manrope(
//                                                                           fontWeight:
//                                                                               FontWeight.w400,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               Color(
//                                                                             0xFF464646,
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 16,
//                                               ),
//                                             ])))
//                                         .toList(),
//                                   ))
//                             ]))
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
