import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class ChangeAvatarRequest extends Profile {}

class OpenImagePicker extends Profile {
  final ImageSource imageSource;

  OpenImagePicker({required this.imageSource});
}
class _ProfileState extends State<Profile> {
 
  String? name, email, phone, address, password, profilePic="default.png";
  // File _image;

  updateProfile() async{
    final response = 
      await http.post(Uri.parse("http://api.postbird.com.ng/api/profileupdate/id"), headers:{"Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLnBvc3RiaXJkLmNvbS5uZ1wvYXBpXC9sb2dpbiIsImlhdCI6MTYzMTk4MDM1OSwiZXhwIjoxNjMxOTgzOTU5LCJuYmYiOjE2MzE5ODAzNTksImp0aSI6IldGMGVJa2tUdUpsM09TQ1EiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.dxulrD4OPxjXz8XAU0-3pyRJkv-NjpZgnXNK_PesiDg  "}, body:{
          "email": email,
          'password': password
        }
      );

      clearForm(){
        emptyName.clear();
        emptyEmail.clear();
        emptyPhone.clear();
        emptyAddress.clear();
        emptyPassword.clear();        
      }
  }

  getProfileDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      password = preferences.getString("pwd");
    });

    final response = 
      await http.post(Uri.parse("https://api.postbird.com.ng/api/login"), headers:{"Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLnBvc3RiaXJkLmNvbS5uZ1wvYXBpXC9sb2dpbiIsImlhdCI6MTYzMTk4MDM1OSwiZXhwIjoxNjMxOTgzOTU5LCJuYmYiOjE2MzE5ODAzNTksImp0aSI6IldGMGVJa2tUdUpsM09TQ1EiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.dxulrD4OPxjXz8XAU0-3pyRJkv-NjpZgnXNK_PesiDg  "}, body:{
          "email": email,
          'password': password
        }
      );
      
    final data = jsonDecode(response.body);
    var profilepic = data['data']['profilepic'];
    setState(() {
      profilePic = profilepic;
    });
    
    print(profilePic);
  }

  TextEditingController textEditingController = new TextEditingController();  
  final emptyName = TextEditingController();
  final emptyEmail = TextEditingController();
  final emptyPhone = TextEditingController();
  final emptyAddress = TextEditingController();
  final emptyPassword = TextEditingController();
  final emptyProfilePic = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 20,
                    ),
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
                      height: height / 1.085,
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                                  'Edit Profile',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20,
                              20,
                              20,
                              10,
                            ),
                            child: Row(
                              children: [
                                // CircleAvatar(
                                //   radius: 360,
                                //   backgroundImage: NetworkImage(
                                //     'https://api.postbird.com.ng/public/img/profile/'+profilePic,
                                //   )
                                // ), 
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                        'https://api.postbird.com.ng/public/img/profile/'+profilePic!,
                                        height: 90.0,
                                        width: 90.0,
                                    ),
                                ),                            
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                    10,
                                    0,
                                    10,
                                    0,
                                  ),
                                  width: 150,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Color(
                                        0xFFDEDEDE,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Color(
                                          0xFF1B1B1B,
                                        ),
                                      ),
                                      Text(
                                        'Upload Photo',
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(
                                            0xFF1B1B1B,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              20,
                              20,
                              10,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: GoogleFonts.manrope(
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
                                  
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: emptyName,
                                      onSaved: (e) => name = e,
                                      onChanged: (String text) {
                                        setState(() {
                                           name = text;
                                        });
                                        print(name);
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDE,
                                            ),
                                          ),
                                        ),
                                        hintText: 'Full Name',
                                        hintStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                        labelStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                            0xFF1B1B1B,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFFEBC52,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              10,
                              20,
                              10,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: GoogleFonts.manrope(
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
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: emptyEmail,
                                      onSaved: (e) => email = e,
                                      onChanged: (String text) {
                                        setState(() {
                                           email = text;
                                        });
                                        print(email);
                                      },
                                      keyboardType:
                                      TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDE,
                                            ),
                                          ),
                                        ),
                                        hintText: 'email@mail.com',
                                        hintStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                        labelStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                            0xFF1B1B1B,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFFEBC52,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              10,
                              20,
                              10,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: GoogleFonts.manrope(
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
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: emptyPhone,
                                      onSaved: (e) => phone = e,
                                      onChanged: (String text) {
                                        setState(() {
                                           phone = text;
                                        });
                                        print(phone);
                                      },

                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDE,
                                            ),
                                          ),
                                        ),
                                        prefix: Text(
                                          '+234  ',
                                         
                                          style: GoogleFonts.manrope(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        hintText: '56789',
                                        hintStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                        labelStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                            0xFF1B1B1B,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFFEBC52,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              10,
                              20,
                              10,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    style: GoogleFonts.manrope(
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
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: emptyAddress,
                                      onSaved: (e) => address = e,
                                      onChanged: (String text) {
                                        setState(() {
                                           address = text;
                                        });
                                        print(address);
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDE,
                                            ),
                                          ),
                                        ),
                                        hintText:
                                        '4270  Benson Park Drive. YOUNG AMERI',
                                        hintStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                        labelStyle: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                            0xFF1B1B1B,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFFEBC52,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
