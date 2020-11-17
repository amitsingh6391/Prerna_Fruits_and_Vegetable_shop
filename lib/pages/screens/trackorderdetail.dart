import 'package:e_commerce/bottomnavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Trackorderdetails extends StatefulWidget {
var orderid;
 Trackorderdetails({@required this.orderid});

  @override
  TrackorderdetailsState createState() => TrackorderdetailsState();
}

class TrackorderdetailsState extends State<Trackorderdetails> {
 

  @override
  void initState() {
    super.initState();
     currentuserid();
     //fetchorders();
   
    
  }


var id;
   currentuserid()async{

  
   setState((){
   id = widget.orderid;
   });

 fetchorders();
 }

  

  var order=[];
 fetchorders() async {
    

    http.Response response =
        await http.get("http://pfv.wonsoft.co.in/API/Post.asmx/GetOrderDetail?id=$id");

    order = json.decode(response.body);

    setState(() {
      order = json.decode(response.body);
     
    });
    print(response.statusCode);
    print("hii");


    if (response.statusCode == 200) {
      print(response.statusCode);

      print(order);
      print(order.length);

      //print(pendingitem[0]["transaction_uid"]);
    } else {
     
      print("345");
    }
  }


  @override
  Widget build(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  Size size = MediaQuery.of(context).size;
    return
      Container(height: MediaQuery.of(context).size.height,
        child: Container(width: MediaQuery.of(context).size.width,
        child: DefaultTabController(
        length: 6,
        child: Scaffold(

         appBar: AppBar(
        title: Text("Orders detail"),backgroundColor: x,

  
      ),
          
      body:SingleChildScrollView(
        
        child:Container(

       child:order.length<1?Column(children
      
      : [
        SizedBox(height:size.height*0.4),
         
         Text("                       You don't have any Orders")
       ]): 
      //  Container(
      //    child:Text(order[0]["NameH"])
      //  )
       
       GridView.builder(
             shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount:order.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
              
                return Card(

                  child:Container(

                    child:Column(children:[
                        Container(
                            height: 64,
                            width: 64,
                            child: Image(
                                image: NetworkImage(
                                  order[index]["Img"],
                                ),
                                fit: BoxFit.fill)),
                                 Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Text(
                              order[index]["NameE"],
                              style: TextStyle(color: Colors.black),
                            )),
                      Text(  order[index]["NameH"]),
                      Row(
                        children:[
                          Text("  Weight  :  "),
                          Text(
                              order[index]["Weight"],
                              style: TextStyle(color: Colors.black45),
                            )
                        ]
                      ),
                       Row(
                        children:[
                          Text("  Rate     :    "),Text(
                              order[index]["Rate"].toString(),
                              style: TextStyle(color: Colors.black45),
                            )
                        ]
                      ),
                       Row(
                        children:[
                          Text("  Qty        :    "),
                          Text(
                              order[index]["Qty"].toString(),
                              style: TextStyle(color: Colors.black45),
                            )
                        ]
                      )
                    ]),

                 

                 ) );
              },
            ),

      )
         
         ) ),),
    ),
      );
  }
}
