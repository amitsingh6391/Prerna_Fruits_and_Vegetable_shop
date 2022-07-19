import 'dart:io';

import 'package:e_commerce/cart.dart';
import 'package:e_commerce/categories.dart';
import 'package:e_commerce/favourite.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/color.dart';

import 'homepage.dart';

class main2 extends StatefulWidget {
  @override
  _main2State createState() => _main2State();
}

class _main2State extends State<main2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Confirm Exit",
                  ),
                  content: Text(
                    "Are you sure you want to exit?",
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("YES"),
                      onPressed: () {
                        //  offline();
                        exit(0);
                      },
                    ),
                    FlatButton(
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }).then((value) => value as bool);
        },
        child: main3(),
      ),
    );
  }
}

class main3 extends StatefulWidget {
  @override
  _main3State createState() => _main3State();
}

class _main3State extends State<main3> with SingleTickerProviderStateMixin {
  TabController? tabController;

  String title = "";
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TabBarView(
        children: <Widget>[main4(), categories(), favourite(), cart()],
        controller: tabController,
      ),
      bottomNavigationBar: Container(
        color: x,
        height: 60,
        child: TabBar(
          onTap: (index) {
            if (index == 0) {
              setState(() {
                title = "Home";
              });
            } else if (index == 1) {
              setState(() {
                title = "Page";
              });
            } else if (index == 2) {
              setState(() {
                title = "Page";
              });
            } else if (index == 3) {
              setState(() {
                title = "profile";
              });
            }
          },
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.white60,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              child: Text(
                "Home",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.widgets_rounded,
                size: 20,
              ),
              child: Text(
                "Category",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.favorite_rounded,
                size: 20,
              ),
              child: Text(
                "Favourite",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.shopping_bag_rounded,
                size: 20,
              ),
              child: Text(
                "Cart",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
