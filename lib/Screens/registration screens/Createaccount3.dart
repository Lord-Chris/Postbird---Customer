import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:postbird/Screens/registration screens/Signup.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toast/toast.dart';

import '../strings.dart';

class CreateAccount3 extends StatefulWidget {
  final phon;
  const CreateAccount3({
    Key? key,
    this.phon,
  }) : super(key: key);

  @override
  _CreateAccount3State createState() => _CreateAccount3State();
}

class _CreateAccount3State extends State<CreateAccount3> {
  String currentText = '';
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController()
    ..text = "";
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool visible = false;
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future resend() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });
    String phone = widget.phon;
    // SERVER LOGIN API URL
    final response = await http.post(Strings.BASE_URL + 'checknum', headers: {
      // "Authorization": "Bearer " + token,
      'Accept': 'application/json'
    }, body: {
      "phone": phone
    });
    final data = jsonDecode(response.body);

    // var user = data['data'];
    // int value = data['value'];
    setState(() {
      visible = false;
    });
  }

  Future save() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    String otp = textEditingController.text;
    String phone = widget.phon;
    // SERVER LOGIN API URL
    final response = await http.post(Strings.BASE_URL + 'verify', headers: {
      // "Authorization": "Bearer " + token,
      'Accept': 'application/json'
    }, body: {
      "phone": phone,
      "verification_code": otp
    });
    final data = jsonDecode(response.body);

    // var user = data['data'];
    // int value = data['value'];
    bool status = data['success'];

    print(status);
    // print(id);
    if (status == true) {
      Toast.show('OTP Successfully Verified', context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: Toast.TOP);
      setState(() {
        visible = false;
      });
      var phon = phone;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUp(phon: phon)));
    } else {
      Toast.show('Poor Network Connection', context,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: Toast.TOP);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
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
          'Login',
          style: TextStyle(
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
              'Please enter the code that sent you at',
              style: TextStyle(
                fontFamily: 'manrope',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(
                  0xFF464646,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '${widget.phon}',
              style: TextStyle(
                fontFamily: 'manrope',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(
                  0xFF464646,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Form(
                // key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      length: 6,
                      appContext: context,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        selectedFillColor: Colors.transparent,
                        inactiveFillColor: Colors.transparent,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.black,
                        activeFillColor:
                            hasError ? Colors.orange : Colors.transparent,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        // print("Completed");
                        save();
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  resend();
                },
                child: Text(
                //  $_start ? :
                  'Resend code in $_start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'manrope',
                      color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => SignUp()));
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
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'manrope',
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
      ),
    );
  }
}
