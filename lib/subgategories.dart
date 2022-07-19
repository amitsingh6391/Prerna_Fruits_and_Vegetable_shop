import 'package:e_commerce/homepage.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:e_commerce/bottomnavbar.dart';
import 'package:e_commerce/signin/sigin.dart';
import "package:e_commerce/pages/screens/product.dart";

class subcategories extends StatefulWidget {
   var Object;
  subcategories({Key? key, required this.Object}) : super(key: key);
  @override
  _subcategoriesState createState() => _subcategoriesState();
}
class _subcategoriesState extends State<subcategories> {

  @override
  void initState() {
        super.initState();
        print(widget.Object);
  }
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(backgroundColor: x,
        title: Text("Covid Essential"),
      ),
      body:Container(margin: EdgeInsets.only(top: 10),
      child: GridView.builder(
        shrinkWrap : true,
        physics: ScrollPhysics(),
        itemCount:widget.Object.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (BuildContext context, int index) {
          var id = widget.Object[index]["ID"];
          print("id");
          print(id);

          return  Card(elevation: 7.0,
              child:GestureDetector(onTap: (){
                 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Products(category_id:widget.Object[index]["ID"])));
              },
                child: Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container( height:50,
                          child:Image(image:NetworkImage(widget.Object[index]["Img"],
                          ),
                              fit:BoxFit.fill
                          )),
                      Container(margin: EdgeInsets.only(top: 10),alignment: Alignment.center,
                          child: Text(widget.Object[index]["Name"],style: TextStyle(color: Colors.black),))
                    ],
                  ),
                ),)
          );
        },
      ),
      ));
  }
}
