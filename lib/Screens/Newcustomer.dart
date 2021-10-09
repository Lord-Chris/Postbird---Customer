import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewCustomer extends StatefulWidget {


  @override
  _NewCustomerState createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/first.jpg'), 
          
            ),
        ),
        child: Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an account \n Create your quick account with \n Postbird and fill up package details ", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                
               //Text("Create your quick account with \n Postbird and fill up package details"),
              ],
           ),
        ),
      ),
    );
  }
}
