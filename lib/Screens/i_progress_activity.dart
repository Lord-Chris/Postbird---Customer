import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/Screens/Inbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InProgressActivityTwo extends StatefulWidget {
  @override
  _InProgressActivityTwoState createState() => _InProgressActivityTwoState();
}

class _InProgressActivityTwoState extends State<InProgressActivityTwo> {
  String id = "";
  List activites = [];

  fetchActivity() async{
    // print("ongoing");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        id = preferences.getString("id")!;
      });
      print('ID: ' + id);

      var surl = Strings.SECBASE_URL;
      var surl2 = surl + id;
      print(surl2);
      print(id);

      final response = await http.get(Uri.parse(surl2));

      final dat = jsonDecode(response.body);

      if(dat['success'] == "true"){
        var data = dat['data'];
        var arr = [];
        for (var i=0; i<data.length; i++){
          if(data[i]['status'] == "0"){
            arr.add(data[i]);
          }
        } 
        //  print(data);   
        setState(() {
          activites = arr;
        });
      }
      print("new activities");
      print(activites);
  }

  @override
  void initState() {
   fetchActivity();
    super.initState();
  }
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: activites
          .asMap()
          .entries
          .map((item) => Padding(
      padding: const EdgeInsets.only(
        right: 30,
        left: 30,
      ),
      // activities[item.key]."s" > 0 ?
      child: Container(
        padding: EdgeInsets.only(
          right: 20,
          top: 15,
          bottom: 15,
          left: 20,
        ),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(
              0xFFE3E3E3,
            ),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'In Progress',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(
                      0xFFFEBC52,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '${activites[item.key]['sendername']}',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(
                      0xFF000000,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '|',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${activites[item.key]['recipientphone']}',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${activites[item.key]['address']}',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ),
    ) .toList(),
    );
  }
}