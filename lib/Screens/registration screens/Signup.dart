import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postbird/Screens/Home3.dart';
import 'package:http/http.dart' as http;
import 'package:postbird/Screens/Login.dart';
import 'package:postbird/Screens/strings.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  final phon;
  const SignUp({
    Key? key,
    this.phon,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obsureText = true;
  final _key = new GlobalKey<FormState>();
  String? token, username, fullname;
  String? email, password, passwordcon;
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 3), () {
      check();
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => NavBar()));
    });
  }

  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      save();
    } else {
      _btnController2.reset();
      // Navigator.pop(context);
    }
  }

  Future save() async {
    final response = await http.post(Strings.BASE_URL + 'register', headers: {
      'Accept': 'application/json'
    }, body: {
      "name": fullname,
      "email": email,
      "username": username,
      "mobile": widget.phon,
      "password": password,
      "password_confirmation": passwordcon,
    });
    final data = jsonDecode(response.body);
    var user = data['data'];
    // int value = data['value'];
    bool status = data['success'];

    print(data);
    // print(id);
    if (status == true) {
      Toast.show('Successfully Registerd ' + fullname!, context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: Toast.TOP);
      // Navigator.pop(context);
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Login()));
    } else {
      Toast.show('Poor Network Connection', context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: Toast.TOP);
      // Navigator.pop(context);
      _btnController2.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    // _btnController2.reset();
    return Scaffold(
      backgroundColor: Color(
        0xFFFFFFFF,
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(
          0xFFFFFFFF,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Color(
                    0xFF000000,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Enter information below to get started',
                style: TextStyle(
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(
                    0xFF000000,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Full Name',
                style: TextStyle(
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(
                    0xFF1B1B1B,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                validator: (e) {
                  // var testemail = e;
                  // bool emailValid = RegExp(
                  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  // .hasMatch(testemail);
                  // if (emailValid == false) {
                  //   return "Please insert valid Email";
                  // }
                },
                onSaved: (e) => fullname = e!,
                onChanged: (String text) {
                  setState(() {
                    fullname = text;
                  });
                },
                keyboardType: TextInputType.text,
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
              SizedBox(
                height: 10,
              ),

              Text(
                'User Name',
                style: TextStyle(
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(
                    0xFF1B1B1B,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                validator: (e) {},
                onSaved: (e) => username = e!,
                onChanged: (String text) {
                  setState(() {
                    username = text;
                  });
                },
                keyboardType: TextInputType.text,
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
              SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(
                    0xFF1B1B1B,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                validator: (e) {
                  var testemail = e;
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(testemail!);
                  if (emailValid == false) {
                    return "Please insert valid Email";
                  }
                },
                onSaved: (e) => email = e!,
                onChanged: (String text) {
                  setState(() {
                    email = text;
                  });
                },
                keyboardType: TextInputType.emailAddress,
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
              SizedBox(
                height: 10,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(
                    0xFF1B1B1B,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Enter Password";
                  }
                },
                onSaved: (e) => password = e!,
                onChanged: (String text) {
                  setState(() {
                    password = text;
                  });
                },
                obscureText: obsureText,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (obsureText = false) {
                          obsureText = true;
                          return;
                        }

                        if (obsureText = true) {
                          obsureText = false;
                          return;
                        }
                      });
                    },
                    child: obsureText
                        ? Icon(
                            Icons.visibility_outlined,
                            color: Color(
                              0xFF464646,
                            ),
                          )
                        : Icon(
                            Icons.visibility_off_outlined,
                            color: Color(
                              0xFF464646,
                            ),
                          ),
                  ),
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirmation Password',
                style: TextStyle(
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(
                    0xFF1B1B1B,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Confirm Password";
                  }
                },
                onSaved: (e) => passwordcon = e!,
                onChanged: (String text) {
                  setState(() {
                    passwordcon = text;
                  });
                },
                obscureText: obsureText,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (obsureText = false) {
                          obsureText = true;
                          return;
                        }

                        if (obsureText = true) {
                          obsureText = false;
                          return;
                        }
                      });
                    },
                    child: obsureText
                        ? Icon(
                            Icons.visibility_outlined,
                            color: Color(
                              0xFF464646,
                            ),
                          )
                        : Icon(
                            Icons.visibility_off_outlined,
                            color: Color(
                              0xFF464646,
                            ),
                          ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color(
                        0xFFDEDEDE,
                      ),
                    ),
                  ),
                  labelStyle: TextStyle(
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
              RoundedLoadingButton(
                color: Color(0xFFFEBC52),
                successColor: Color(0xFFFEBC52),
                controller: _btnController2,
                onPressed: () => _doSomething(_btnController2),
                valueColor: Colors.black,
                borderRadius: 10,
                child: Text('Register',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'manrope',
                        color: Colors.white)),
              ),
              SizedBox(
                height: 20,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(bottom: 20),
              //     child: Container(
              //       height: 50,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         color: Color(
              //           0xFFFEBC52,
              //         ),
              //       ),
              //       child: Center(
              //         child: Text(
              //           'Register',
              //           style:TextStyle(
              //             fontFamily: 'manrope',
              //             color: Color(0xFFFFFFFF),
              //             fontWeight: FontWeight.w500,
              //             fontSize: 16,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
