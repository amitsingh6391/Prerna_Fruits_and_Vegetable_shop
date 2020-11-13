import 'package:e_commerce/cartdelievery.dart';
import 'package:e_commerce/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

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
 var numberodproduct;
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
    print(response.statusCode);
    print("hii");

    print(numberodproduct );

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(numberodproduct );
      print(numberodproduct .length);

      //print(pendingitem[0]["transaction_uid"]);
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

      //print(pendingitem[0]["transaction_uid"]);

      Navigator.push(
                                             context,
                                             MaterialPageRoute(builder: (context) => cart()));
    } else {
      numberodproduct  = [];
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
              height:105,
              child: numberodproduct.length == 0 || numberodproduct.length == null
                  ? Text("")
                  : Column(
                      //mainAxisSize: MainAxisSize.max,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       
                        Row(
                          children:[
                            Text("SubTotal:  ",style:TextStyle(fontSize:15)),
                            Spacer(),
                            Text(numberodproduct.last["Total"].toString(),),
                            SizedBox(width:10),
                          ]
                        ),
                        Row(
                          children:[
                            Text("Delivery Charge  :  ",style:TextStyle(fontSize:15)),
                            Spacer(),
                            Text("  0  ",),
                            SizedBox(width:10),
                          ]
                        ),
                         Row(
                          children:[
                            Text("Total  :  ",style:TextStyle(fontSize:15,color:x,fontWeight:FontWeight.bold)),
                            Spacer(),
                            Text(numberodproduct.last["Total"].toString()
                            ,style:TextStyle(fontSize:15,color:x,fontWeight:FontWeight.bold)),
                            SizedBox(width:10),
                          ]
                        ),

                        Container(

                          color:x,

                          child:Row(
                           children:[

                           

                              Center(
                               
                                
                                child:Text("Total ${numberodproduct.last["TotQty"]} items  ₹.${numberodproduct.last["Total"]} ",
                                style:TextStyle(fontSize:17,fontWeight:FontWeight.bold,color:Colors.white))
                              
                            ),
                            
                            //Icon(Icons.checkout),
                            
                            SizedBox(height:50)
                            
                           ]
                          )
                        )
                      ],
                    )),
        ),
      body: Container(
          child: numberodproduct.length < 1
              ? Container(
                  child: Center(
                      child: Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.green),
                )))
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
                          height: size.height * 0.177,
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
                                      SizedBox(height: 10),
                                      Row(children: [
                                        Text("M.R.P :  ₹"),
                                        Text(
                                          numberodproduct[index]["Rate"].toString(),
                                          style:
                                              TextStyle(color: Colors.black45),
                                        )
                                      ]),
                                      SizedBox(height: 10),
                                      Container(
                                          margin: EdgeInsets.only(right: 100),
                                          child: Text(
                                            numberodproduct[index]["Weight"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(height: 10),
                                     
                                     
                                      Row(
        children: <Widget>[

          Text("Qty:   "),
            Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Text(
                                            numberodproduct[index]["Qty"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),




                                           


                                          SizedBox(
                                            width:size.width*0.05
                                          ),

                                          GestureDetector(
                                            onTap:(){

                                              cartitemremove(
                                               numberodproduct[index]["CartID"].toString(),
                                                numberodproduct[index]["Qty"].toString());

                                            },
                                            child:Icon(Icons.delete,color:x))
                    
        ],
      ),
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

                                          Text("X"),
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
        ]
      )
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