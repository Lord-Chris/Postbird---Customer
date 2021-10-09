import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/GuidePage.dart';
import 'package:postbird/Screens/Home6.dart';
import 'package:postbird/Screens/Homemap.dart';
import 'package:postbird/Screens/Homemapa.dart';
import 'package:postbird/Screens/ShipmentStart.dart';
import 'package:postbird/Screens/inbox.dart';
import 'package:postbird/Screens/account.dart';
import 'package:postbird/Screens/My Activity.dart';
import 'package:postbird/Screens/ManualInputTrack.dart';
import 'package:postbird/Screens/strings.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _children = [HomePage(), Activity(), Inbox(), Account()];
  final _key = new GlobalKey<FormState>();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  // LoginStatus _loginStatus = LoginStatus.notSignIn;

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 3), () {
      check();
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => NavBar()));
    });
  }

  final rateConroller = TextEditingController();
  final rateConrollerr = TextEditingController();
  


  String email = "", password="", avatar = "", fullname = "", id = "", amount = "", activityStatusText="No Activity", profilePic='default.png', token="", userRef="";
  String credits = "0";
  List activities = [];

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      email = preferences.getString("email");
      fullname = preferences.getString("name");
      password = preferences.getString('pwd');
      var t = preferences.getString("token");
      token = 'Bearer '+t;
    });
    print('email: ' + email);
    print('ID: ' + id);
    print('name: ' + fullname.toString());
    print('token: ' + token);
    login();
  }


  login() async {
   print("ongoing"+email+password);
    final response =
    await http.post(Uri.parse(Strings.BASE_URL + 'login'), body: {
      "email": email,
      "password": password,
    });

   final data = jsonDecode(response.body);  
     print(data); 
    // return data;
    bool success = data['success'];
    var t = data['token'];
    print(t);
    print(data);

    if (success == true) {
      setState(() {
        token = 'Bearer '+t;
        savePref(token);        
      });
    } else {
      print("fail");
    }
    
    getProfileDetails();
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      if (int.parse(amount) < 500) {
        Toast.show('Can not purchase below \₦ 500', context,
            duration: Toast.LENGTH_LONG,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity: Toast.TOP);
        _btnController2.reset();
      } else {
        purchasecredit();
      }
    } else
      _btnController2.reset();
  }

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  purchasecredit() async {
    var ad = Strings.BASE_URL + 'fundcusr';
    var credit = rateConroller.text;
    var response = await http.post(Uri.encodeFull(ad), headers: {
      "accept": "application/json"
    }, body: {
      "user_id": id,
      "amount": amount.toString(),
      "credit": credit.toString()
    });

    final data = jsonDecode(response.body);
    var stat = data['status'];
    var messg = data['message'];

    if (stat == true) {
      // topUp();
    } else if (stat == false) {
      Toast.show(messg, context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: Toast.TOP);
      Navigator.pop(context);
    }
  }

  getProfileDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      password = preferences.getString("pwd");
    });

    final response = 
      await http.post(Uri.parse("https://api.postbird.com.ng/api/userProfile"), headers:{"Authorization" : token}, body:{
          "email": email,
          'password': password
        }
      );
      
    final data = jsonDecode(response.body);
    var c = data['credit_balance'];
    var profilepic = data['profilepic'];
    setState(() {
      credits = c;
      profilePic = profilepic;
    });
    
    sendData(data);  
    
    print(c);
  }


sendData(data) async{
      //   final response = await http.post(Uri.parse("https://k-dev.org/postbird/reg/"), body:{
      //     "id": data['id'],
      //     "username": data['username'],
      //     "email": data['email'],
      //     "mobile": data['userid']
      //   }
      // );
      final response = 
      await http.post(Uri.parse("https://k-dev.org/postbird/reg/"), headers:{"Authorization" : token}, body:{
             "id": data['id'].toString(),
             "name": data['name'].toString(),
             "username": data['username'].toString(),
             "email": data['email'].toString(),
             "mobile": data['mobile'].toString()
        }
      );
      final reqData = jsonDecode(response.body);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        preferences.setString('userRef', reqData['ref']);
      });
      print("send data");
      print(reqData['ref']);
}     

savePref(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString('token', token);
    });
  }

fetchActivity() async{
  // print("ongoing");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
    print('ID: ' + id);

    var surl = Strings.SECBASE_URL;
    var surl2 = surl + id;
    print(surl2);
    print(id);

    final response =    
        await http.get(Uri.parse(surl2));

  //  final data = jsonDecode(response.body);
   List data = ['a', 'b', 'c'];
   print("activites");
   print(data); 
    var len = data.length;
   setState(() {
      activities = data;    
      if(len > 1){
        activityStatusText = "$len orders";
        // activityStatusText "$len orders";
      }else if(len == 1){
        activityStatusText = "$len order";
      }
   });
}

  @override
  void initState() {
    getPref();
    fetchActivity();
    super.initState();
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Container(
                  child: new Form(
                      key: _key,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Replenish your wallet',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'manrope',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(
                                      0xFF000000,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Text(
                                //   'your are getting '
                                //   '(0) credits for ₦\ $amount',
                                //   style: TextStyle(
                                //     fontFamily: 'manrope',
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: 16,
                                //     color: Color(
                                //       0xFF1B1B1B,
                                //     ),
                                //   ),
                                // ),
                                FutureBuilder(
                                    future: ratesystem(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.data == null) {
                                        return Text(
                                            'Awaiting'
                                            '.... For amount to be input',
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
                                                      ..text = snapshot.data
                                                          .toString(),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'You\'re getting' +
                                                          '₦\' $amount'
                                                              .replaceAllMapped(
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
                                            TextFormField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: rateConrollerr
                                                  ..text = 'You\'re getting ' +
                                                      '(' +
                                                      snapshot.data.toString() +
                                                      ') credits for \₦ '
                                                              '$amount'
                                                          .toString()
                                                          .replaceAllMapped(
                                                              new RegExp(
                                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                              (Match m) =>
                                                                  "${m[1]},") +
                                                      '.00',
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      'You\'re transfering '
                                                              "\₦" +
                                                          snapshot.data
                                                              .toString()
                                                              .replaceAllMapped(
                                                                  new RegExp(
                                                                      r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                                  (Match m) =>
                                                                      "${m[1]},") +
                                                          '.00',
                                                  hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ],
                                        );
                                      }
                                    }),
                                TextFormField(
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "Please Enter Amount";
                                    }
                                  },
                                  onSaved: (e) => amount = e,
                                  onChanged: (String text) {
                                    ratesystem();
                                    setState(() {
                                      amount = text;
                                    });
                                    print(amount);
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
                                    labelStyle: TextStyle(
                                      fontFamily: 'manrope',
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
                                SizedBox(height: 10),
                                RoundedLoadingButton(
                                  color: Color(0xFFFEBC52),
                                  successColor: Color(0xFFFEBC52),
                                  controller: _btnController2,
                                  onPressed: () =>
                                      _doSomething(_btnController2),
                                  valueColor: Colors.black,
                                  borderRadius: 10,
                                  child: Text('Procced',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'manrope',
                                          color: Colors.white)),
                                ),
                              ]))),
                )),
          );
        });
  }

  ratesystem() async {
    var webAddress = Strings.BASE_URL + 'ratesystem/' + amount;
    var response = await http.post(
      Uri.encodeFull(webAddress),
      headers: {"Authorization": "Bearer ", 'accept': 'application/json'},
      //  body: {
      //   "trans_id": usertransid,
      //   "amount": amount,
      //   "recipient": recipient,
      //   "vendor": sorttcode
      // }
    );

    final data = jsonDecode(response.body);
    var rate = data['data'];
    // print(rate);
    return rate;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.03,
              left: screenWidth * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Image(
                      image: AssetImage('assets/group2.png'),
                    ),
                  ),
                  Text('                          '),
                  // Column(
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {
                  //         _modalBottomSheetMenu();
                  //       },
                  //       icon: Icon(Icons.add_box),
                  //       color: Colors.white,
                  //     ),
                  //     Text(
                  //       'buy credit',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
            
            Positioned(
              top: screenHeight * 0.22,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Image(
                      height: 240,
                      width: 240,
                      image: NetworkImage(
                        'https://api.postbird.com.ng/public/img/profile/'+profilePic,
                      )
                    ),
                    Text(
                      activityStatusText,
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Create an order ?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 240,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 10,
                            bottom: 10,
                            left: 0,
                            child: Container(
                              width: 240,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Color(
                                  0xFFFEBC52,
                                ),
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
                                      blurRadius: 40),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 240,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: Color(
                                  0xFFFEBC52,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 13,
                            left: 61,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomMapScreen(
                                            name: fullname, ids: id)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(
                                            107, 103, 210, 0.3499999940395355),
                                        offset: Offset(0, 18),
                                        blurRadius: 40)
                                  ],
                                ),
                                child: Text(
                                  'Send a Package',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Manrope',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                             ),
                            ),
                          ),
                        ]))
                  ],
                ),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Color.fromRGBO(250, 250, 250, 1),
                ),
              ),
            ),
            
            Positioned(
              top: screenHeight * 0.16,
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.14,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        10.0, // Move to right 10  horizontally
                        10.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        _modalBottomSheetMenu();
                      },
                      child:
                     
                    Positioned(
                      top: screenHeight * 0.04,
                      left: screenWidth * 0.03,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(' '),
                          Icon(
                            Icons.lock_clock,
                            color: Colors.orangeAccent,
                          ),
                          Text(
                            ' TopUp Credit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    ),
                    Positioned(
                      top: screenHeight * 0.07,
                      left: screenWidth * 0.03,
                      child: Text(
                        credits + '  Credits',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Manrope',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.03,
                      left: screenWidth * 0.43,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          border: Border.all(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        child: TextButton.icon(
                          //FlatButton.icon
                           // color: Colors.white70,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TrackPackage1()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orangeAccent,
                              size: 20,
                            ),
                            label: Text(
                              'Track Order',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                            ), ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: onTappedBar ,
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.orangeAccent,
      //   type: BottomNavigationBarType.fixed,
      //   // fixedColor: Colors.orangeAccent,
      //   items: [
      //     BottomNavigationBarItem(
      //
      //       title: Text(
      //         'Home',
      //         style: TextStyle(
      //             fontFamily: 'Manrope',
      //
      //             letterSpacing: 0,
      //             fontWeight: FontWeight.bold,
      //             height: 1),
      //       ),
      //       icon: Icon(
      //         Icons.home_outlined,
      //
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Text(
      //         'Activity',
      //         style: TextStyle(
      //             fontFamily: 'Manrope',
      //             fontSize: 16,
      //             letterSpacing: 0,
      //             fontWeight: FontWeight.bold,
      //             height: 1),
      //       ),
      //       icon: Icon(
      //         Icons.all_inbox,
      //
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Text(
      //         'Chat',
      //         style: TextStyle(
      //
      //             fontFamily: 'Manrope',
      //             letterSpacing: 0,
      //             fontWeight: FontWeight.bold,
      //             height: 1),
      //       ),
      //       icon: Icon(
      //         Icons.message_outlined,
      //
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title:  Text(
      //         'Me',
      //         style: TextStyle(
      //             fontFamily: 'Manrope',
      //             fontSize: 16,
      //             letterSpacing: 0,
      //             fontWeight: FontWeight.bold,
      //             height: 1),
      //       ),
      //       icon: Icon(
      //         Icons.person_outlined,
      //
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String userRef="", token="";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      var t = preferences.getString("token");
      token = 'Bearer '+t;
      userRef = preferences.getString("userRef");
    });
    print('token: ' + token);
    // print('user: ' + userRef);

    fetchNotifications();
  }


  fetchNotifications() async{
    final response = 
    await http.post(Uri.parse("https://k-dev.org/postbird/notif/"), headers:{"Authorization" : token}, body:{
        "user": userRef
      }    
    );
    final reqData = jsonDecode(response.body);
    print("notification");
    print(reqData);
    print(userRef);
  }

  int currentIndex = 0;
  final List<Widget> _children = [HomePage(), Activity(), Inbox(), Account()];

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // getPref();        
    super.initState();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTappedBar,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orangeAccent,
          type: BottomNavigationBarType.fixed,
          // fixedColor: Colors.orangeAccent,
          items: [
            BottomNavigationBarItem(
              title: Text(
                'Home',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Activity',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
              icon: Icon(
                Icons.all_inbox,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Chat',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
              icon: Icon(
                Icons.message_outlined,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Me',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
              icon: Icon(
                Icons.person_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
