import 'package:e_commerce/bottomnavbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce/color.dart';
import 'package:geolocator/geolocator.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import "package:e_commerce/signup/updateprofile.dart";
class profile extends StatefulWidget {

  var id;
  profile({@required this.id});

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
 



  

  var name, email, mobile, address, city, area, pincode, gender,userid;
 @override
  void initState(){
    getuserdetails();
super.initState();
  }


getuserdetails() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
    
    setState((){
    
     mobile = preferences.getString("number");

      
     
     name = preferences.getString('name');
     email = preferences.getString('mail');
     pincode = preferences.getString('pincode');
    address =preferences.getString('address');
     gender =  preferences.getString('gender');
    city=  preferences.getString('city');
    area=  preferences.getString('area');

    });

    print(name);
    print(mobile);
    print(email);
    print(pincode);
    print(address);
    print(gender);
    print(city);
    print(area);

}
  

 

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(alignment: Alignment.topCenter,
                  height:size.height*0.3,color:x,
                  child: Container(height:size.height*0.25,alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 30),
                    child: Image(
                      image: AssetImage("assets/WhatsApp Image 2020-11-03 at 2.05.54 PM (1)_preview_rev_1.png"),
                    ),
                  ),
                ),

                 Container(
                      width: size.width * 1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child: Icon(Icons.person,
                                        color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(name.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child:
                                        Icon(Icons.hotel, color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(address.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),
                          //  SizedBox(height: size.height * 0.04),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child:
                                        Icon(Icons.location_city, color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(city.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      //  fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),


                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child:
                                        Icon(Icons.phone, color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mobile.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      //  fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),

                            Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child: Icon(Icons.circle,
                                        color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(gender.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      //  fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child: Icon(Icons.email_rounded,
                                        color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(email.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      //  fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),


                          GestureDetector(
                            onTap:(){
 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateProfile(id:widget.id)),);
                            },
                            child:Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor:x,
                                    radius: 25,
                                    child: Icon(Icons.arrow_forward,
                                        color: Colors.white)),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Update Profile",
                                    style: TextStyle(
                                      fontSize: 15,
                                      //  fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),
                          ),
                          
                        ],
                      ))
               
              ],
            )));
  }
}

