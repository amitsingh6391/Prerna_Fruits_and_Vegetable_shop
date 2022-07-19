import 'package:e_commerce/subgategories.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import "package:e_commerce/pages/screens/product.dart";

List? category = [
  {
    "Child": "wait",
    "ID": 1,
    "IsChild": false,
    "Name": "Fruits",
    "Img": "http://pfv.wonsoft.co.in/images/cat/fruits.png"
  },
];

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  void initState() {
    super.initState();
    fetcategory();
  }

  Future fetcategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', "logedin");

    http.Response response = await http
        .get(Uri.parse("http://pfv.wonsoft.co.in/API/Post.asmx/GetCat"));

    category = json.decode(response.body);

    setState(() {
      category = json.decode(response.body);
    });
    print(response.statusCode);
    print("hii");

    print(category);

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(category);
      print(category!.length);
    } else {
      category = [];
      print("345");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shop By Category"),
          backgroundColor: x,
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          card2(),
        ],
      ),
    );
  }
}

class card2 extends StatefulWidget {
  @override
  _card2State createState() => _card2State();
}

class _card2State extends State<card2> {
  @override
  void initState() {
    super.initState();
    print("***********8");
    print(category);
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: category!.length < 1
          ? Center(
              child: Column(children: [
              SizedBox(
                height: 200,
              ),
              Text(
                "",
              )
            ]))
          : GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: category!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                var c = category![index]["Child"];
                print(c);
                return Card(
                    child: GestureDetector(
                  onTap: () {
                    if (c == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(
                                  category_id: category![index]["ID"])));
                    } else {
                      print(c);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => subcategories(
                                    Object: c,
                                  )));
                    }
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 50,
                            child: Image(
                                image: NetworkImage(
                                  category![index]["Img"],
                                ),
                                fit: BoxFit.fill)),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Text(
                              category![index]["Name"],
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                ));
              },
            ),
    );
  }
}
