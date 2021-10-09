import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/NotificationDetails3.dart';

class NotificationDetails2 extends StatefulWidget {
  @override
  _NotificationDetails2State createState() => _NotificationDetails2State();
}

class _NotificationDetails2State extends State<NotificationDetails2> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.orange[300],
      child: Scaffold(
        appBar:  AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Maintainance Update',
              style: TextStyle(
                  color: Color.fromRGBO(27, 27, 27, 1),
                  fontFamily: 'Manrope',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(

              children: [
                Container(
                  width: screenWidth,
                  height:screenHeight*0.3,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/update.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0,20,12,20),
                  child: Container(
                    width: screenWidth,
                    child: Text(
                      'Dear Boxi-er,\n\n We’ve added a new Select All in Artboard command to the Edit menu so you can quickly grab all of the layers on any Artboard you’ve selected. We’ve also given the different Select All commands their sub-menu.\n\n We added [X feature], so you can now do [Y action]. \n\n Fixed a crash that could occur when you try and drag with the Magic Wand tool. \n\n Fixed a bug where the correct type weight wouldn’t appear for fonts with the same name. 🌈',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width:screenWidth,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),

                    color: Color(
                      0xFFFEBC52,
                    ),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationDetails3()));
                    },
                    child: Text(
                      'Update Now',
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
            ),
          ],
        ),
      ),
    );
  }
}
