import 'package:flutter/material.dart';

import "package:e_commerce/pages/screens/trackorderdetail.dart";
import '../color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab> {
  @override
  void initState() {
    super.initState();
    currentuserid();
  }

  var userid;
  currentuserid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString("Id");
    });
    print("userid");
    print(userid);
    fetchallorders();
  }

  List<dynamic>? allorders = [];
  Future fetchallorders() async {
    http.Response response = await http.get(Uri.parse(
        "http://pfv.wonsoft.co.in/API/Post.asmx/GetOrderList?UID=$userid"));

    allorders = json.decode(response.body);

    setState(() {
      allorders = json.decode(response.body);
    });
    print(response.statusCode);
    print("hii");

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(allorders);
      print(allorders!.length);

      //print(pendingitem[0]["transaction_uid"]);
    } else {
      allorders = [];
      print("345");
    }
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: DefaultTabController(
          length: 6,
          child: Scaffold(
              appBar: AppBar(
                title: Text("Track Orders"),
                backgroundColor: x,
              ),
              body: SingleChildScrollView(
                  child: Container(
                child: allorders!.length < 1
                    ? Column(children: [
                        SizedBox(height: size.height * 0.4),
                        Text("                       You don't have any Orders")
                      ])
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: allorders!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                (orientation == Orientation.portrait) ? 2 : 3),
                        itemBuilder: (BuildContext context, int index) {
                          var orderid = allorders![index]["ID"];
                          print(orderid);
                          return Card(
                              elevation: 6,
                              child: GestureDetector(
                                onTap: () {
                                  print(orderid);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Trackorderdetails(
                                                orderid: orderid,
                                              )));
                                },
                                child: Container(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                " Order No :  ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  allorders![index]["OrderNo"],
                                                  style: brighttext)),
                                        ]),
                                        Row(children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                " Order Date :  ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  allorders![index]["OrderDt"],
                                                  style: brighttext)),
                                        ]),
                                        Row(children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                " Total :  ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  allorders![index]["Total"]
                                                      .toString(),
                                                  style: brighttext)),
                                        ]),
                                        Row(children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                " PayMode :  ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  allorders![index]["PayMode"],
                                                  style: brighttext)),
                                        ]),
                                        Row(children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                " Shipping :  ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  allorders![index]["Shipping"]
                                                      .toString(),
                                                  style: brighttext)),
                                        ]),
                                        Row(children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                " Status :  ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                allorders![index]["Status"],
                                                style: brighttext,
                                              )),
                                          SizedBox(width: 10),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text("    Detail",
                                                  style: TextStyle(
                                                      color: x,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ])
                                      ]),
                                ),
                              ));
                        },
                      ),
              ))),
        ),
      ),
    );
  }
}
