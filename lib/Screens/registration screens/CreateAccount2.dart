import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/registration screens/CreateAccount3.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../strings.dart';

class CreateAccount2 extends StatefulWidget {
  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
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

  String phoneno = '';
  final _key = new GlobalKey<FormState>();

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    } else
      _btnController2.reset();
  }

  save() async {
    String phone = phoneno;
    String phoneba = '+234' + phone;
    // print(phoneba);
    final response = await http.post(Strings.BASE_URL + 'checknum',
        headers: {'Accept': 'application/json'},
        body: {"mobile": phoneba.toString()});
    final data = jsonDecode(response.body);
    bool status = data['success'];
    // print(response.statusCode);
    print(status);
    if (status == true) {
      Toast.show('OTP Successfully Sent to $phoneno', context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: Toast.TOP);
      var phon = phoneba;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CreateAccount3(phon: phon)));
    } else {
      Toast.show('Looks Like the phone number as already taken ', context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: Toast.TOP);
      _btnController2.reset();
      // var phon = phone;
      // Navigator.pop(context);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => StepTwoScreen(phon: phon)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xFFFFFFFF,
      ),
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Create Account',
          style: TextStyle(
            fontFamily: 'manrope',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(
              0xFF000000,
            ),
          ),
        ),
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
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Enter Your Phone Number',
              style: TextStyle(
                fontFamily: 'manrope',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(
                  0xFF000000,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We believe that a connected world is a better world, and that belief guides.',
              style: TextStyle(
                fontFamily: 'manrope',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(
                  0xFF000000,
                ),
              ),
            ),
            SizedBox(
              height: 30,
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
                  child: Form(
                      key: _key,
                      child: Container(
                        child: TextFormField(
                          validator: (e) {
                            if (e.isEmpty) {
                              return "Please Enter a Valid Phone No";
                            }
                          },
                          onSaved: (e) => phoneno = e,
                          onChanged: (String text) {
                            setState(() {
                              phoneno = text;
                            });
                            print(phoneno);
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
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              'By clicking ‘Continue’, you have read and agree with our ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'manrope',
                  color: Color(
                    0xFF000000,
                  ),
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
            SizedBox(
              height: 3,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Terms',
                  style: TextStyle(
                    fontFamily: 'manrope',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(
                      0xFFFEBC52,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(
                          0xFF000000,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: 'Conditions',
                      style: TextStyle(
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(
                          0xFFFEBC52,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RoundedLoadingButton(
              color: Color(0xFFFEBC52),
              successColor: Color(0xFFFEBC52),
              controller: _btnController2,
              onPressed: () => _doSomething(_btnController2),
              valueColor: Colors.black,
              borderRadius: 10,
              child: Text('Continue',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'manrope',
                      color: Colors.white)),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount3()));
            //   },
            //   child: Container(
            //     height: 50,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: Color(
            //         0xFFFEBC52,
            //       ),
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Continue',
            //         style: TextStyle(
            //           fontFamily: 'manrope',
            //           color: Color(0xFFFFFFFF),
            //           fontWeight: FontWeight.w500,
            //           fontSize: 16,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
