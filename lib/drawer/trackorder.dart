import 'package:e_commerce/bottomnavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List order=[{"Child": "wait",
    "ID": 1, "IsChild": false, "Name": "Fruits","Price": "Rs.30",
    "Img": "http://pfv.wonsoft.co.in/images/cat/fruits.png"
  },];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(height: MediaQuery.of(context).size.height,
        child: Container(width: MediaQuery.of(context).size.width,
        child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(132),
            child: Container(color: x,
              height: 132.0,
              child: Column(
                children: [
                  Container(margin: EdgeInsets.only(top: 30,left: 10,bottom: 30),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => main2()),);
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                          Container(margin: EdgeInsets.only(left: 30),
                              child: Text("Track Order",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                        ],
                      )),
                  new TabBar(
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontSize:17.0,fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                          text: "ALL",
                      ),
                      Tab(
                          text: "In-Process"
                      ),
                      Tab(
                          text: "Shipped"
                      ),
                      Tab(
                          text: "Delivered"
                      ),
                      Tab(
                          text: "Cancelled"
                      ),
                      Tab(
                          text: "Returned"
                      ),
                    ],
                    isScrollable: true,
                  ),
                ],
              ),
            ),
          ),
          body:
          TabBarView(
            children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(itemCount:order.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Card(
                        child: Container(
                                  height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Container( height:80,
                                  child:Image(image:NetworkImage(order[index]["Img"],
                                  ),
                                      fit:BoxFit.fill
                                  )),
                              Column(
                                children: [
                                  Container(margin: EdgeInsets.only(top: 40),alignment: Alignment.center,
                                      child: Text(order[index]["Name"],style: TextStyle(color: Colors.black),)),
                                  Container(margin: EdgeInsets.only(top: 10),alignment: Alignment.center,
                                      child: Text(order[index]["Name"],style: TextStyle(color: Colors.black),)),
                                ],
                              )
                            ],
                          ),
                        ),);
                },
              ),
            ),
              Container(
                  height:MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text("NO Tracking Found"),
                  ),
              ),
              Container(
                  height:MediaQuery.of(context).size.height,
                child: Center(
                  child: Text("NO Tracking Found"),
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height,
                child: Center(
                  child: Text("NO Tracking Found"),
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height,
                child: Center(
                  child: Text("NO Tracking Found"),
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height,
                child: Center(
                  child: Text("NO Tracking Found"),
                ),
              ),

            ],
          ),
        ),),
    ),
      );
  }
}