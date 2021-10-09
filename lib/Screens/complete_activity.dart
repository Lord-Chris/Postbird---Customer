import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postbird/Screens/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompleteActivity extends StatefulWidget {
  @override
  _CompleteActivityState createState() => _CompleteActivityState();
}

class _CompleteActivityState extends State<CompleteActivity> {
  String id = "", name="", username="", email="", mobile="", token = "";
  List activites = [];


getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
    print('ID: ' + id);

    var surl = Strings.SECBASE_URL;
    var surl2 = surl + id;
    print(surl2);
    print(id);
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

   final dat = jsonDecode(response.body);  
   print(dat);
   if(dat['success'] == true ){
     print("Processsssssssssssssssssssssssssssssssssssssssssssssssssss");
     var data = dat['data'];
    var arr = [];
    for (var i=0; i<data.length; i++){
      if(data[i]['status'] == "1"){                         
      var uid = data[i]['user_id'];
      print("uid"+uid);
      final response = 
        await http.get(Uri.parse("http://api.postbird.com.ng/api/getuser/" + uid));
        final row = jsonDecode(response.body);
        print("user details"); print(row);
        if(row['success'] == true){
          var name = row['data'][0]['name'];
          var username = row['data'][0]['username'];
          var email = row['data'][0]['email'];
          var mobile = row['data'][0]['mobile'];   
          

          sendData(id, name, username, email, mobile) async{
                final response = 
                await http.post(Uri.parse("https://k-dev.org/postbird/reg/"), headers:{"Authorization" : token}, body:{
                      "id": id,
                      "name": name,
                      "username": username,
                      "email": email,
                      "mobile": mobile
                  }
                );
                final reqData = jsonDecode(response.body);
                var ref = reqData['ref'];

                var ar = {"id": data[i][id], "user_id": data[i]['user_id'], "date": data[i]['date'], "address": data[i]['address'],
                  "detination": data[i]['detination'], "frmlt": data[i]['frmlt'], "tolt": data[i]['tolt'], "frmlg": data[i]['frmlg'], "tolg": data[i]['tolg'],
                  "amount": data[i]['amount'], "packagedetails": data[i]['packagedetails'], "status": data[i]['status'], "packagename": data[i]['packagename'],
                  "sendername": data[i]['sendername'], "senderphone": data[i]['senderphone'], "packtype": data[i]['packtype'], "packsize": data[i]['packsize'],
                  "fragile": data[i]['fragile'], "recipientname": data[i]['recipientname'], "recipientaddress": data[i]['recipientaddress'],
                  "postalzip": data[i]['postalzip'], "recipientphone": data[i]['recipientphone'], "additionalinfo": data[i]['additionalinfo'],
                  "created_at": data[i]['created_at'], "updated_at": data[i]['updated_at'], "ref": ref};        
                arr.add(ar);
                // SharedPreferences preferences = await SharedPreferences.getInstance();
                // setState(() {
                //   preferences.setString('userRef', reqData['ref']);                
                // });
                print("send data");
                print(reqData['ref']);
          }    
          sendData(id, name, username, email, mobile); 
        }
      }
    } 
    //  print(data);   
     setState(() {
       activites = arr;
     });
  }     
    //  print(activites);
}

     


final words = ['foo', 'bar', 'baz', "f"];

  @override
  void initState() {
   fetchActivity();
   getPref();
    super.initState();
  }
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: activites
          .asMap()
          .entries
          .map((item) => Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFFAFAFA,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.only(
                      right: 15,
                      left: 20,
                      top: 5,
                      bottom: 10,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Text(
                            '${activites[item.key]['date']}',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Received',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(
                                        0xFF000000,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.green[800],
                                    size: 18,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Express',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(
                                    0xFFFEBC52,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${activites[item.key]['detination']}',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '113  Five Pointst, Daytona Beach, Florida, 32122',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  SizedBox(
                    height: 10,
                  ),
                  
                ],
              ),
            ),
          )
          .toList(),
    );    
  }
}