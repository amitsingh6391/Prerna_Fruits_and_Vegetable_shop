import 'package:e_commerce/cart.dart';
import 'package:e_commerce/drawer/trackorder.dart';
import 'package:e_commerce/drawer/wallet.dart';
import 'package:flutter_share/flutter_share.dart';

import 'faq.dart';
import "referearn.dart";
import "notification.dart";
import "package:e_commerce/homepage.dart";

import 'package:e_commerce/signin/sigin.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color.dart';
import 'about.dart';
import 'contact.dart';
import 'privacy.dart';
import 'terms.dart';
import "package:e_commerce/signin/forgotpass.dart";

class drawerr extends StatefulWidget {
  @override
  _drawerrState createState() => _drawerrState();
}

class _drawerrState extends State<drawerr> {
  Future<void> share() async {
    await FlutterShare.share (
        title: "Prerna",
        text: "app link",
        linkUrl:'',
        chooserTitle: "Share Prerna"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(



        child: Container(



            child: ListView(
                children: <Widget>[

                  Container(

                      height: 180,color:x,
                      child:Image(
                        //color:Colors.green,
                          image:NetworkImage("http://pfv.wonsoft.co.in/images/logo.png"))

                  ),
                  GestureDetector(
                    onTap:(){
 Navigator.push(context,
                        MaterialPageRoute(builder: (context) => main4()),);
                    },
                    child:Container(
                    margin: EdgeInsets.only(left:15,top:10),
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.home,color: Colors.black45,size: 28,),
                          Container(margin: EdgeInsets.only(left: 20
                          ),
                              child: Text("Home",style: TextStyle(color: Colors.black),))
                        ],
                      ),
                    ),
                  )),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => cart()),);
                    },
                    child:Container(
                      margin: EdgeInsets.only(left:15,top:10),
                      child:ListTile(

                        title: Row(
                          children: [
                            Icon(Icons.shopping_cart,color: Colors.black45,size: 28,),
                            Container(margin: EdgeInsets.only(left: 20
                            ),
                                child: Text("Cart",style: TextStyle(color: Colors.black),))
                          ],
                        ),
                      ),) ,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => notification()),);
                    },
                    child:  Container(
                      margin: EdgeInsets.only(left:15,top:10),
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.notifications,color: Colors.black45,size: 28,),
                            Container(margin: EdgeInsets.only(left: 20
                            ),
                                child: Text("Notifications",style: TextStyle(color: Colors.black),))
                          ],
                        ),
                      ),

                    ),
                  ),
              GestureDetector(onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => wallet()),);
              },
                child: Container(
                  margin: EdgeInsets.only(left: 15,top: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.account_balance_wallet,color: Colors.black45,size: 28,),
                        Container(margin: EdgeInsets.only(left: 20
                        ),

                            child: Text("Wallet Balance",style: TextStyle(color: Colors.black),))
                      ],
                    ),
                  ),
                ),
              ),


                  GestureDetector(onTap:(){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstTab()),);
                  },
                    child:Container(
                      margin: EdgeInsets.only(left: 15,top: 10),
                      child: ListTile(title: Row(children: [
                        Icon(Icons.local_shipping,color: Colors.black45,size: 28,),
                        Container(margin: EdgeInsets.only(left: 20
                        ),

                            child: Text("Track Order",style: TextStyle(color: Colors.black),))
                      ],
                      ),
                      ),
                    ),),
                  GestureDetector(
                    onTap:(){

                       Navigator.push(context,
                      MaterialPageRoute(builder: (context) => forgotp()),);

                    },child:Container(
                      margin: EdgeInsets.only(left: 15,top: 10),
                      child: ListTile(title: Row(children: [
                        Icon(Icons.lock,color: Colors.black45,size: 28,),
                        Container(margin: EdgeInsets.only(left: 20),
                          child: Text("Change Password",style: TextStyle(color: Colors.black),),
                        )
                      ],),)
                  )),
                  GestureDetector(onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => refer()),);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15,top: 10),
                    child: ListTile(title: Row(children: [
                      Icon(Icons.person_add,color: Colors.black45,size: 28,),
                      Container(margin: EdgeInsets.only(left: 20),
                        child: Text("Refer & Earn",style: TextStyle(color: Colors.black),),
                      )
                    ],)),
                  ),),
                  GestureDetector(onTap:(){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => contact()),);
                  },
                    child:Container(
                        margin: EdgeInsets.only(left: 15,top: 10),
                        child: ListTile(title: Row(children: [
                          Icon(Icons.contact_page,color: Colors.black45,size: 28,),
                          Container(margin: EdgeInsets.only(left: 20),
                            child: Text("Contact Us",style: TextStyle(color: Colors.black),),
                          )
                        ],),)
                    ),),
                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => about()),);
                  },
                    child: Container(
                      margin: EdgeInsets.only(left: 15,top: 10),
                      child: ListTile(title: Row(children: [
                        Icon(Icons.info,color: Colors.black45,size: 28,),
                        Container(margin: EdgeInsets.only(left:20),
                          child: Text("About Us",style: TextStyle(color: Colors.black),),
                        )
                      ],)),
                    ),),
                  GestureDetector(onTap: () {
                    LaunchReview.launch(
                      // androidAppId: "com.iyaffle.kural",
                      // iOSAppId: "585027354",
                    );
                  },
                    child: Container(
                      margin: EdgeInsets.only(left: 15,top:10),
                      child: ListTile(title: Row(children: [
                        Icon(Icons.star_outline,color: Colors.black45,size: 28,),
                        Container(margin: EdgeInsets.only(left:20),
                          child: Text("Rate Us",style: TextStyle(color: Colors.black),),
                        )
                      ],)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      share();
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top:10),
                        child: ListTile(title: Row(children: [
                          Icon(Icons.share,color: Colors.black45,size: 28,),
                          Container(margin:EdgeInsets.only(left:20),
                            child: Text("Share App",style: TextStyle(color: Colors.black),),
                          )
                        ],))
                    ),
                  ),

                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => faq()),);},

                    child:
                    Container(
                        margin: EdgeInsets.only(left:15, top:10),
                        child: ListTile(title: Row(children: [
                          Icon(Icons.help,color: Colors.black45,size: 28,),
                          Container(margin:EdgeInsets.only(left:20),
                            child: Text("FAQ",style: TextStyle(color: Colors.black),),
                          )
                        ],),)
                    ),),
                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => terms()),);
                  },

                    child:
                    Container(
                        margin: EdgeInsets.only(left:15, top:10),
                        child: ListTile(title: Row(children: [
                          Icon(Icons.event_note,color: Colors.black45,size: 28,),
                          Container(margin:EdgeInsets.only(left:20),
                            child:  Text("Terms & Conditions",style: TextStyle(color: Colors.black),),
                          )
                        ],),)
                    ),
                  ),
                  GestureDetector(
                    onTap:() async{

                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.setString('email', "logout");

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>sigin(),
                          ));

                    },

                    child:Container(
                        margin: EdgeInsets.only(left:15, top:10),
                        child: ListTile(title: Row(children: [
                          Icon(Icons.logout,color: Colors.black45,size: 28,),
                          Container(margin:EdgeInsets.only(left:20),
                            child:  Text("Logout",style: TextStyle(color: Colors.black),),
                          )
                        ],),)
                    ),

                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => privacy()),);
                  },
                    child:Container(
                        margin: EdgeInsets.only(left:15, top:10),
                        child: ListTile(title: Row(children: [
                          Icon(Icons.policy,color: Colors.black45,size: 28,),
                          Container(margin:EdgeInsets.only(left:20),
                            child: Text("Privacy Policy",style: TextStyle(color: Colors.black),),
                          )
                        ],),)
                    ),
                  )    ])));
  }
}
