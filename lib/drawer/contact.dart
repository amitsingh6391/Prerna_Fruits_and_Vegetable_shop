import 'package:flutter/material.dart';
import "package:e_commerce/color.dart";
class  contact extends StatefulWidget {
  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:x,
        title: Text("Contact Us"),
      ),
      body: SingleChildScrollView(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(margin: EdgeInsets.only(left:10,right: 10,top: 30),
            child: Text("Prerna ",style: TextStyle(fontSize: 28),),
          ),
          Container(margin: EdgeInsets.only(left:10),
            child: Column(
                children: [
                  Text("For any kind of queries related to orders or services feel free to contact us on our official email address or phone number as given below :",style: TextStyle(fontSize: 16)),

                  Text("Call Us : 1234567890", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("   Email : xyz@gmail.com", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18), ),
                ]),
          ),
          Container(margin: EdgeInsets.only(left:10,right: 10,top: 30),
            child: Text("Delivery Timings :",style: TextStyle(fontSize: 20),),
          ),
          Text("  1. 8:00 AM To 10:30 PM",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18 ),),
          Text("  Note: you can order for maximum 1 days in advance. i.e. - Tomorrow only.",style: TextStyle(fontSize: 16),)

        ],
      )
        ,),
    );
  }
}