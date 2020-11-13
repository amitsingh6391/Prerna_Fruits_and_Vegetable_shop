
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';
class cartdelv extends StatefulWidget {
  @override
  _cartdelvState createState() => _cartdelvState();
}

class _cartdelvState extends State<cartdelv> {
  TextEditingController PromocodeEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: x,
        title: Text("Checkout"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(alignment: Alignment.center,height: 40,margin: EdgeInsets.only(left: 80),
                child: Row(
                  children: [
                   Icon(Icons.arrow_forward_ios_sharp,color:x,),
                    Text("Delivery",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(margin: EdgeInsets.only(top: 20),
                height: 180,
                child: Card(elevation: 5.0,
                  child: Container(margin: EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Delivery Address",style: TextStyle(color: x,fontSize: 17),)
                          ],
                        ),




                        //
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 105,width: MediaQuery.of(context).size.width,
                child: Card(elevation: 5.0,
                  child: Container(margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Have a Promo Code ?",style: TextStyle(color: x,fontSize: 17),),
                            GestureDetector(
                              onTap: (){},
                              child: Icon(Icons.refresh,color: x,),
                            )
                          ],
                        ),
                          Row(
                            children: [
                              Container(margin: EdgeInsets.all(5),
                                height: 50,width: 230,decoration: BoxDecoration(border:Border.all(color: Colors.black,width: 1)),
                                child: TextFormField(

                                keyboardType: TextInputType.emailAddress,
                                controller:PromocodeEditingController,
                                decoration: new InputDecoration(
                                  hintText: '    Promo Code',
                                  labelText: '   Promo Code',
                                ),
                        ),
                              ),
                              Container(margin: EdgeInsets.only(left: 3,),height: 50,
                                child: RaisedButton(onPressed: (){},
                                  child: Text("Apply"),color: x,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 200,width: MediaQuery.of(context).size.width,
                child: Card(elevation: 5,
                  child: Container(
                      margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                       Row(
                         children: [
                           Text("Order Summary",style: TextStyle(color: x,fontSize: 17),),
                         ],
                       ),






                      ],
                    ),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.all(6),
                width: MediaQuery.of(context).size.width,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    RaisedButton(onPressed: (){

                    }, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: x)
                    ),
                      color: x,
                    child: Text("Confirm"),)
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
