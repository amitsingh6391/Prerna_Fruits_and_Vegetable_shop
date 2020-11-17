
import 'package:e_commerce/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import "package:http/http.dart" as http;
import "package:e_commerce/bottomnavbar.dart";
import "package:e_commerce/drawer/trackorder.dart";

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {


 @override
 void initState(){
   currentuserid();  
   //fetchcartitem();
   super.initState();

  }
 var numberodproduct=[];
 var cartitem;
var userid;

 currentuserid()async{

   SharedPreferences preferences = await SharedPreferences.getInstance();
   setState((){
     userid = preferences.getString("Id");
   });
print("userid");
   print(userid);
fetchcartitem();
 }

fetchcartitem() async {
    

    String apiUrl = "http://pfv.wonsoft.co.in/API/Post.asmx/Cart?UID=$userid";
    print("apiUrl***********88");
    print(apiUrl);
    http.Response response = await http.get(apiUrl);

   numberodproduct=json.decode(response.body);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    

    setState(() {
      numberodproduct  = json.decode(response.body);
      cartitem = preferences.getInt("cartitem");
    });

    preferences.setInt("cartitem",numberodproduct.last["TotQty"]);
    var number= preferences.getInt("cartitem");
    print("*************8$number");

    print(response.statusCode);
    print("hii");

    print(numberodproduct );

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(numberodproduct);
     
    } else {
      numberodproduct  = [];
      print("345");
    }
  }

   


cartitemremove(var itemid, var qty) async {
    

    String apiUrl = "http://pfv.wonsoft.co.in/API/Post.asmx/CartRem?UID=$userid&itemID=$itemid&itemQty=$qty";
    print("apiUrl***********88");
    print(apiUrl);
    http.Response response = await http.get(apiUrl);

   numberodproduct=json.decode(response.body);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      numberodproduct  = json.decode(response.body);
      cartitem = preferences.getInt("cartitem");
    });
    print(response.statusCode);
    print("hii");

    print(numberodproduct );

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(numberodproduct );
      print(numberodproduct .length);

     

      Navigator.push(
                                             context,
                                             MaterialPageRoute(builder: (context) => cart()));
    } else {
      numberodproduct  = [];
      print("345");
    }
  }

//confirmation dialog...

showAlertDialog(BuildContext context , var total) {
    Widget okbtn = FlatButton(
      child: Text("Yes"),
      onPressed: () {
       // Navigator.pop(context);
       Navigator.of(context,rootNavigator:true).pop();
       checkout(total);
      },
    );

    Widget nobtn = FlatButton(
      child: Text("No"),
      onPressed: () {
        //Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>main2()));
      Navigator.of(context,rootNavigator:true).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Are you sure that you want to complete this order "),
      actions: [okbtn,nobtn],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }


  //checkout cart...........

List oredrstatus;
  checkout(var total) async {
    

    String apiUrl = "http://pfv.wonsoft.co.in/API/Post.asmx/CheckOut?UID=$userid&OrderTot=$total";

    print("apiUrl***********88");
    print(apiUrl);
    http.Response response = await http.get(apiUrl);

   oredrstatus =json.decode(response.body);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    

    setState(() {
     oredrstatus  = json.decode(response.body);
      
    });

    preferences.setInt("cartitem",numberodproduct.last["TotQty"]);
    var number= preferences.getInt("cartitem");
    print("*************8$number");

    print(response.statusCode);
    

    if (response.statusCode == 200) {
      print(response.statusCode);
      print("Oredrs placed");

       Fluttertoast.showToast(
        msg: "Your Order No ${oredrstatus[0]["OrderNo"]} is Successfully Placed.",
        fontSize: 15,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
      );

       SharedPreferences preferences = await SharedPreferences.getInstance();
       preferences.setInt("cartitem",0);

      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>FirstTab()));
      

      
    } else {
      oredrstatus = [];
      print("345");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),backgroundColor: x,

  
      ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            margin:
                      EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                   
              color:Colors.white,
              height:120,
              child: numberodproduct.length == 0 || numberodproduct.length == null
                  ? Text("")
                  : Column(
                      //mainAxisSize: MainAxisSize.max,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       
                        Row(
                          children:[
                            Text("SubTotal  ",style:TextStyle(fontSize:12)),
                            Spacer(),
                            Text(" ₹ ",style:TextStyle(fontSize:12)),
                            Text(numberodproduct.last["Total"].toString(),
                            style:TextStyle(fontSize:12)),
                            SizedBox(width:10),
                          ]
                        ),
                         SizedBox(height:5),
                        Row(
                          children:[
                            Text("Delivery Charge    ",style:TextStyle(fontSize:12)),
                            Spacer(),
                             Text(" ₹ ",style:TextStyle(fontSize:12)),
                            Text("0  ",style:TextStyle(fontSize:12)),
                            SizedBox(width:10),
                          ]
                        ),
                        //SizedBox(height:5),

                         Row(
                          children:[
                            Text("Total    ",style:TextStyle(fontSize:14,fontWeight:FontWeight.bold)),
                            Spacer(),
                             Text(" ₹ ",style:TextStyle(fontSize:14)),
                           Text( numberodproduct.last["Total"].toString()
                            ,style:TextStyle(fontSize:14,fontWeight:FontWeight.bold)),
                            SizedBox(width:10,height:30),
                          ]
                        ),
                        //  Row(
                        //   children:[
                        //     Text("Total    ",style:TextStyle(fontSize:12,color:Colors.black,fontWeight:FontWeight.bold)),
                        //     Spacer(),
                        //     Text( numberodproduct.last["Total"].toString()
                        //     ,style:TextStyle(fontSize:15,color:x,fontWeight:FontWeight.bold)),
                        //     SizedBox(width:20),
                        //   ]
                        // ),

                      GestureDetector(
                          onTap:(){
                            showAlertDialog(context,numberodproduct.last["Total"]);

                          //  checkout(numberodproduct.last["Total"]);

                          },
                          child:Container(



                         decoration: BoxDecoration(
       color:x,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
               color:Colors.white,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),

                          child:Row(
                           children:[

                           

                              Center(
                               
                                
                                child:Text("  Total ${numberodproduct.last["TotQty"]} item(s)  ₹ ${numberodproduct.last["Total"]} ",
                                style:TextStyle(fontSize:17,fontWeight:FontWeight.bold,color:Colors.white))
                              
                            ),


Spacer(),
                            Text("Checkout",style:TextStyle(fontSize:17,fontWeight:FontWeight.bold,color:Colors.white)),
                            SizedBox(width:10),
                            Icon(Icons.arrow_forward,color:Colors.white),
                            
                            
                            SizedBox(height:50)
                            
                           ]
                          )
                       ))
                      ],
                    )),
        ),
      body: Container(
          child: numberodproduct.length < 1
              ? Container(
                  child: Center(
                      child: Center(

                       child: Column(children:[

//CircularProgressIndicator(backgroundColor: Colors.green),
SizedBox(height:size.height*0.4),
Text("Your cart is empty ",style:TextStyle(fontSize:25))
                        ]),
                
                      
                )
                )
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: numberodproduct.length,
                  itemBuilder: (BuildContext context, int index) {

                    
                   
        
       

                    return Card(
                        child: GestureDetector(
                      onTap: () {
                       
                      },
                      child: Card(
                        child: Container(
                          height: size.height * 0.164,
                          color: Colors.white,
                          child: Column(
                            children: [
                              
                              Row(
                                children: [
                                  Container(
                                    width: 135,
                                    height: 130,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            margin: EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Image(
                                                image: NetworkImage(
                                                   numberodproduct[index]["Img"]),
                                                fit: BoxFit.fill)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Row(children: [
                                        Text(
                                          numberodproduct[index]["NameE"].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          numberodproduct[index]["NameH"].toString(),
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),

                                        SizedBox(width:50),
                                        
                                      ]),

                                       Container(
                                          margin: EdgeInsets.only(right: 100),
                                          child: Text(
                                            numberodproduct[index]["Weight"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                               ),
                                          )),
                                          SizedBox(height: 10),
      Row(
        children:[
          Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Text(
                                            numberodproduct[index]["Rate"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),

                                          Text("  X  ",style:TextStyle(fontSize:12)),
                                           Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Text(
                                            numberodproduct[index]["Qty"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),


                                           Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Text(
                                            "       ₹ ${numberodproduct[index]["MRP"]
                                                .toString()}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
SizedBox(width:size.width*0.14),


//Spacer(),


                                                                           Container(
                                                                             //alignment:Alignment.centerRight,
                                                                             child:
                                                                              GestureDetector(
                                            onTap:(){

                                              cartitemremove(
                                               numberodproduct[index]["CartID"].toString(),
                                                numberodproduct[index]["Qty"].toString());

                                            },
                                            child:Icon(Icons.close,color:x))),
        ]
      ),
                                      SizedBox(height: 10),
                                      // Row(children: [
                                      //   Text("M.R.P :  ₹"),
                                      //   Text(
                                      //     numberodproduct[index]["Rate"].toString(),
                                      //     style:
                                      //         TextStyle(color: Colors.black45),
                                      //   )
                                      // ]),
                                     // SizedBox(height: 10),
                                     
                                    
                                     
                                     
      //                                 Row(
      //   children: <Widget>[

      //     Text("Qty:   "),
      //       Container(
      //                                     margin: EdgeInsets.only(right: 0),
      //                                     child: Text(
      //                                       numberodproduct[index]["Qty"]
      //                                           .toString(),
      //                                       style: TextStyle(
      //                                           color: Colors.black,
      //                                           fontWeight: FontWeight.bold),
      //                                     )),




                                           


      //                                     SizedBox(
      //                                       width:size.width*0.05
      //                                     ),

      //                                     GestureDetector(
      //                                       onTap:(){

      //                                         cartitemremove(
      //                                          numberodproduct[index]["CartID"].toString(),
      //                                           numberodproduct[index]["Qty"].toString());

      //                                       },
      //                                       child:Icon(Icons.delete,color:x))
                    
      //   ],
      // ),
// SizedBox(height: 10),
//       Row(
//         children:[
//           Container(
//                                           margin: EdgeInsets.only(right: 0),
//                                           child: Text(
//                                             numberodproduct[index]["Rate"]
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           )),

//                                           Text("X"),
//                                            Container(
//                                           margin: EdgeInsets.only(right: 0),
//                                           child: Text(
//                                             numberodproduct[index]["Qty"]
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           )),


//                                            Container(
//                                           margin: EdgeInsets.only(right: 0),
//                                           child: Text(
//                                             "       ₹ ${numberodproduct[index]["MRP"]
//                                                 .toString()}",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           )),
//         ]
//       )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
                  })
                  ),
    );
  }
}