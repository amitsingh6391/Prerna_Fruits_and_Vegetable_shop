import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/cart.dart';
import 'package:e_commerce/drawer/drawer.dart';
import 'package:e_commerce/subgategories.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:e_commerce/cart.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'categories.dart';
import 'color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:e_commerce/bottomnavbar.dart';
import 'package:e_commerce/signin/sigin.dart';
import 'package:launch_review/launch_review.dart';
import "package:e_commerce/pages/screens/product.dart";

import 'drawer/about.dart';
import 'drawer/contact.dart';
import 'drawer/privacy.dart';
import 'drawer/terms.dart';

List category = [
  {
    "Child": "wait",
    "ID": 1,
    "IsChild": false,
    "Name": "Fruits",
    "Img": "http://pfv.wonsoft.co.in/images/cat/fruits.png"
  },
];

final bannerimg = "https://homepages.cae.wisc.edu/~ece533/images/mountain.png";
final bannerimg2 =
    "https://www.learningcontainer.com/wp-content/uploads/2020/08/Large-Sample-png-Image-download-for-Testing.png";

final List<String> card2txt = [
  "Mushroom",
  "Pea",
  "Red Chilly",
  "Tomatoes",
  "Garlic",
];
final List<String> cardtxt = [
  "Fruits",
  "Orange",
  "Apple",
];
final List<String> items = ["ax", "Axax", "SAxa"];

class main4 extends StatefulWidget {
  @override
  _main4State createState() => _main4State();
}

class _main4State extends State<main4> {
  @override
  void initState() {
    super.initState();
    fetcategory();
  }

  var cartitem;
  Future fetcategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', "logedin");
    preferences.setString('email', "logedin");

    http.Response response =
        await http.get("http://pfv.wonsoft.co.in/API/Post.asmx/GetCat");

    category = json.decode(response.body);

    setState(() {
      category = json.decode(response.body);
      cartitem = preferences.getInt("cartitem");
    });
    print(response.statusCode);
    print("hii");

    print(category);

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(category);
      print(category.length);

      //print(pendingitem[0]["transaction_uid"]);
    } else {
      category = [];
      print("345");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            flexibleSpace: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 50, left: 40, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "   Prerna fruits and Vegetables",
                        style: GoogleFonts.caveatBrush(
                            color: Colors.white, fontSize: 20),
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap:(){

                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cart(
                              )));

                            },
                            child:Icon(Icons.shopping_cart)),
                          CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.red,
                              child: Text(cartitem.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)))
                        ],
                      )
                    ],
                  ),

                  // Icon(Icons.shopping_cart),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SearchBar()],
                )
              ],
            ),
            backgroundColor: x,
          ),
        ),
        drawer: drawerr(),
        body: Body());
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.white, width: 1)),
          child: TextField(
            decoration: new InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixText: ' ',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ));
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
          card(),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              "Shop by Category",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          card2(),
          card4(),
          listcard()
        ],
      ),
    );
  }
}

class card extends StatefulWidget {
  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  void initState() {
    super.initState();
    fetcbanners();
  }

  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List banners = [
    "https://homepages.cae.wisc.edu/~ece533/images/fruits.png",
    "https://png.pngtree.com/png-clipart/20190515/original/pngtree-orange-png-png-image_3619070.jpg"
  ];

//here we fetch all he banners this is first part of our body...

  Future fetcbanners() async {
    http.Response response =
        await http.get("http://pfv.wonsoft.co.in/API/Post.asmx/GetBanner");
    banners = json.decode(response.body);
    print(response.statusCode);
    print("hii");

    print(banners);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print("bnners");

      print(banners);

      setState(() {
        banners = json.decode(response.body);
      });

      //print(pendingitem[0]["transaction_uid"]);
    } else {
      print("345");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: 170.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: banners
                  .map((item) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    item,
                                  ),
                                  fit: BoxFit.cover),
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ))
                  .toList()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(banners, (index, url) {
            return Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? x : Colors.grey,
              ),
            );
          }),
        ),
      ],
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
      child: category.length < 1
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
              itemCount: category.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                var c = category[index]["Child"];
                print(c);
                return Card(
                    child: GestureDetector(
                  onTap: () {
                    if (c == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(
                                  category_id: category[index]["ID"])));
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
                            height: 64,
                            width: 64,
                            child: Image(
                                image: NetworkImage(
                                  category[index]["Img"],
                                ),
                                fit: BoxFit.fill)),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Text(
                              category[index]["Name"],
                              style: TextStyle(color: Colors.black),
                            )),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              category[index]["NameH"],
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

class card4 extends StatefulWidget {
  @override
  _card4State createState() => _card4State();
}

class _card4State extends State<card4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10.0,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Selling Items",
                      style: TextStyle(
                          color: x, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ButtonTheme(
                      minWidth: 60,
                      height: 30,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => categories()));
                          //View All
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: x)),
                        color: x,
                        child: Container(
                            child: Text(
                          "View all",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 330,
                      child: Container(
                        height: 200,
                        child: StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            elevation: 10.0,
                            child: Container(
                                alignment: Alignment.center,
                                child: new Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //Image(image: NetworkImage(cardimg[index])),
                                      new Text(
                                        cardtxt[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(2, index.isOdd ? 4 : 2),
                          mainAxisSpacing: 12.0,
                          crossAxisSpacing: 5.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class listcard extends StatefulWidget {
  @override
  _listcardState createState() => _listcardState();
}

class _listcardState extends State<listcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Items",
                    style: TextStyle(
                        color: x, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ButtonTheme(
                    minWidth: 60,
                    height: 30,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => categories()));
                        //View All
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: x)),
                      color: x,
                      child: Container(
                          child: Text(
                        "View all",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Image(image: NetworkImage(card2img[index])),
                                Text(card2txt[index])
                              ],
                            )));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
