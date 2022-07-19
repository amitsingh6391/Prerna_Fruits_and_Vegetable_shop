import 'package:flutter/material.dart';
class wallet extends StatefulWidget {
  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Wallet Balance"),

      ),

      body: Container(height: MediaQuery.of(context).size.height,
        child:   ListView.builder(itemCount: 1,



            itemBuilder: (context,int index){



              return Container(height: 100,width: MediaQuery.of(context).size.width,



                  child: Card(elevation: 10.0,
                    child: Container(height: 100,

                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(margin: EdgeInsets.only(left:20),
                                child: Text("Earn Bonus for Registration on Prerna\n  ",style:TextStyle(color:Colors.blueAccent, fontSize: 15),)),




                          ],

                          ),
                          Container(margin: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Icon(Icons.date_range,color: Colors.redAccent,size: 16,),
                                Container(margin: EdgeInsets.only(left:2),
                                  child: Text("Valid From:",style: TextStyle(fontSize: 13),),
                                ),
                              ],
                            ),
                          )

                        ],),



                    ),)
              );







            }),
      ),


    );
  }
}