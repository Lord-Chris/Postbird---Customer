import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/account.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';
import 'dart:convert';
import 'dart:async';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}


class _ChatState extends State<Chat> {
  String id="", email="", fullname="", password="", token="", userRef="", reply="", recipRef="68b1632757088r2m";
  String replySent = 'false';
  List chat = [], users = [];
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      email = preferences.getString("email");
      fullname = preferences.getString("name");
      password = preferences.getString('pwd');
      var t = preferences.getString("token");
      token = 'Bearer '+t;
      userRef = preferences.getString("userRef");
    });
    print('email: ' + email);
    print('ID: ' + id);
    print('name: ' + fullname.toString());
    print('token: ' + token);
    print ('ref' + userRef);

    fetchChat();

    Timer.periodic(new Duration(seconds: 3), (timer) {
      fetchChat();
    });
  }

  sendReply() async{    
    emptyReply.clear();
    List ar = [{"who":users[0]['userRef'], "msg": reply, "time":'now'}];    
    chat.add(ar[0]);
    controller.jumpTo(controller.position.maxScrollExtent);

    markRead();
    print("send reply");
    final response = 
    await http.post(Uri.parse("https://k-dev.org/postbird/reply/"), headers:{"Authorization" : token}, body:{
        "user": users[0]['userRef'],
        "reply": reply,
        "rcvr": users[0]['recipRef'],
      }    
    );
    final reqData = jsonDecode(response.body);
    print(reqData);
    
    // var fetch = fetchChat();
    // if(fetch == "success"){
    //   setState(() {
    //     replySent = 'true';
    //   });
    // }
    
      fChat() async{
        print(userRef+"about to send ref");
        final response =
        await http.post(Uri.parse("https://k-dev.org/postbird/fetch/"), headers:{"Authorization" : token}, body:{
          "user": users[0]['userRef'],
          "rcvr": users[0]['recipRef']
        });

        final reqData  = jsonDecode(response.body);
        print(reqData);
        markRead();

        if(reqData['done'] == true){           
           setState(() {
            chat = reqData['data']['reply'];            
           });
           Timer(Duration(seconds: 1), () => controller.jumpTo(controller.position.maxScrollExtent)); 
           print(chat);
           print(userRef);
        }
        
      }

      fChat();
  }

  fetchChat() async{
    print(userRef+"about to send ref");
    final response =
    await http.post(Uri.parse("https://k-dev.org/postbird/fetch/"), headers:{"Authorization" : token}, body:{
      "user": users[0]['userRef'],
      "rcvr": users[0]['recipRef']
    });

    final reqData  = jsonDecode(response.body);
    print(reqData);
    markRead();

    if(reqData['done'] == true){
        setState(() {
         chat = reqData['data']['reply'];                 
        });
        Timer(Duration(seconds: 1), () => controller.jumpTo(controller.position.maxScrollExtent)); 
        //  timer.cancel();
        print(chat);
        print(userRef);
    }
    
    
  }

  markRead() async{
    final response = 
    await http.post(Uri.parse("https://k-dev.org/postbird/readmsg/"), headers:{"Authorization" : token}, body:{
      "user": users[0]['userRef'],
      "rcvr": users[0]['recipRef']
    });

    final reqData  = jsonDecode(response.body);
    print(reqData);
  }

  

  TextEditingController textEditingController = new TextEditingController();
  final emptyReply = TextEditingController();

  ScrollController controller = new ScrollController();
  
  final words = ['foo', 'bar', 'baz', "f"];

  @override
  void initState() {
    getPref();    
    super.initState();
  }
  Widget build(BuildContext context) {
    final u = ModalRoute.of(context).settings.arguments;   
    users = u; 
    print(u);
    print("users"+" "); print(users);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(
        0xFFFEBC52,
      ),
      body: SafeArea(
        child: ListView(          
          children: [
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: Container(
                      width: width / 1,
                      height: height / 1.135,
                      decoration: BoxDecoration(
                        color: Color(
                          0xFFEEEEEE,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height / 1.162,
                      decoration: BoxDecoration(
                        color: Color(
                          0xFFFAFAFA,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              left: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                  ),
                                ),
                                Text(
                                 'chat',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: 1,
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Color(
                              0xFFE7E7E7,
                            ),
                          ),



                          Container(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              16,
                              20,
                              0,
                            ),
                            width: double.infinity,
                            height: 70,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 17,
                                  backgroundImage: NetworkImage(
                                    'https://api.postbird.com.ng/public/img/profile/'+users[0]['profilePic'],
                                  ),
                                ),
                                Positioned(
                                  left: 40,
                                  child: Text(
                                    'User',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Text(
                                    'Today, 12 Sep 2020',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 40,
                                  top: 16,
                                  child: Text(
                                    users[0]['name'],
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color(
                                        0xFF000000,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),




                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Color(
                              0xFFE7E7E7,
                            ),
                          ),


                          Container(
                            padding: EdgeInsets.only(
                              right: 20,
                              left: 20,
                              top: 20,
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              // liest view
                              children: [
                                // Container(
                              SizedBox(
                              height: 450,
                              child: ListView(
                                controller: controller,
                                scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                children: chat                                                                
                              .asMap()
                              .entries
                              .map((item) => Padding(
                                 padding: const EdgeInsets.only(
                                  left: 0,
                                  right: 0,
                                ),
                                child:  Column(
                                  
                                  children: <Widget>[
                                  
                                Container(
                                child: (chat[item.key]['who'] == userRef)
                                // first message boc
                                ? null :
                                Container(
                                  height: 55,
                                  width: 170,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(
                                    // right: 38,
                                    left: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xFFFFFFFF,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        chat[item.key]['msg'],
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Color(
                                            0xFF464646,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        chat[item.key]['time'],
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(
                                            0xFF464646,
                                          ),
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                )
                                
                                ),

                                SizedBox(
                                  height: 16,
                                
                                ),
                                
                                
                                
                                
                                // second messgae box
                                Container(
                                child: (chat[item.key]['who'] == userRef)
                                // first message boc
                                ? 
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 55,
                                    width: 170,
                                    padding: EdgeInsets.only(
                                      right: 18,
                                      left: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xFFFEBC52,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          chat[item.key]['msg'],
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Color(
                                              0xFFFFFFFF,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          chat[item.key]['time'],
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color(
                                              0xFFFFFFFF,
                                            ),
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                )
                                : null
                                ),

                                SizedBox(
                                  height: 16,
                                ),
                                
                                  ]
                              ),
                              ),
                              )          
                              .toList(),                    
                              ),
                                ),
                            // )                            
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
            Container(
              width: double.infinity,
              height: height / 16,
              color: Color(
                0xFFFFFFFF,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      width: width / 1.2,
                      child: TextField(
                        keyboardType: TextInputType.text,    
                        controller: emptyReply,                 
                        onChanged: (String text) {
                          setState(() {
                            reply = text;
                            // replySent = 'false';
                          });

                        },                               
                        
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xFF000000,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(
                          0xFFFEBC52,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          sendReply();
                        },
                        child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),    
    );
  }
}