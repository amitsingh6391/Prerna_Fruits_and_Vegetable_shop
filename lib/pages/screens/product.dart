import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import "package:e_commerce/color.dart";
import "package:e_commerce/productdetail.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "package:e_commerce/cart.dart";

class Products extends StatefulWidget {
  var category_id;
  Products({@required this.category_id});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var id;

var cartitem;
  List products = [];

  fetchproduct() async {
    setState(() {
      id = widget.category_id;
    });

    String apiUrl = "http://pfv.wonsoft.co.in/API/Post.asmx/GetProd?CatID=$id";
    print("apiUrl***********88");
    print(apiUrl);
    http.Response response = await http.get(apiUrl);

    products = json.decode(response.body);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      products = json.decode(response.body);
       cartitem = preferences.getInt("cartitem");
    });
    print(response.statusCode);
    print("hii");

    print(products);

    if (response.statusCode == 200) {
      print(response.statusCode);

      print(products);
      print(products.length);

      //print(pendingitem[0]["transaction_uid"]);
    } else {
      products = [];
      print("345");
    }
  }

  bool like = false;
  Color grey = Colors.grey;
  Color red = Colors.red;
  var currentvariants;

  var qty;
  int _indx = 0;


   

  @override
  void initState() {
    super.initState();
    print("widget.category_id");
    print(widget.category_id);
    fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: x,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Products      "),
            // GestureDetector(
            //   onTap: (){
            //    // search();
            //   },
            //   child: Icon(Icons.search,color: Colors.white,),
            // ),
            // GestureDetector(
            //   onTap: (){
            //    // filter();
            //   },
            //   child: Icon(Icons.sort,color: Colors.white,),
            // ),

            SizedBox(width: 60),
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
      ),
      body: Container(
          child: products.length < 1
              ? Container(
                  child: Center(
                      child: Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.green),
                )))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("variants");

                    //print(variants);

                    var qty = products[index]["Qty"];



                    return Card(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Productdetail(
                                    product_id: products[index]["ID"],
                                    productimg: products[index]["Img"],
                                    hindiname: products[index]["NameH"],
                                    englishname: products[index]["NameE"],
                                    price: products[index]["Rate"],
                                    weight: products[index]["Weight"],
                                    variant: products[index]["Variants"])));
                      },
                      child: Card(
                        child: Container(
                          height: size.height * 0.17,
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
                                                    products[index]["Img"]),
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
                                          products[index]["NameE"].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          products[index]["NameH"].toString(),
                                          style:
                                              TextStyle(color: Colors.black45),
                                        )
                                      ]),
                                      SizedBox(height: 10),
                                      Row(children: [
                                        Text("M.R.P :  ₹"),
                                        Text(
                                          products[index]["Rate"].toString(),
                                          style:
                                              TextStyle(color: Colors.black45),
                                        )
                                      ]),
                                      SizedBox(height: 10),
                                      Container(
                                          margin: EdgeInsets.only(right: 100),
                                          child: Text(
                                            products[index]["Weight"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(height: 10),
                                     
                                      Row(
        children: <Widget>[
           
                    
        ],
      ),
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


//dropdown....

class ListItem {
  var value;
  var name;

  ListItem(this.value, this.name);
}

class dropdown extends StatefulWidget {
  var variants;
  dropdown({this.variants});

  @override
  _dropdownState createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  List<ListItem> _dropdownItems = [
    // ListItem("1:"250 gm"),
    // ListItem("2":"500 gm"),
    // ListItem("3":"1 kg"),
    ListItem(3, "1 kg"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    print("varinats in initstate");
    print(widget.variants);
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(color: x, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<ListItem>(
              underline: Container(
                color: Colors.transparent,
              ),
              value: _selectedItem,
              hint: Text(
                "More Varient",
                style: TextStyle(color: x),
              ),
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              }),
        ));
  }
}
