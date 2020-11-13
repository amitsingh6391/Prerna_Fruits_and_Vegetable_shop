import 'package:e_commerce/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import "package:e_commerce/cart.dart";


class Productdetail extends StatefulWidget {

var productimg,hindiname,englishname,price,weight;
var variant,product_id;
Productdetail({@required this.productimg,@required this.hindiname,@required this.englishname,
@required this.price,@required this.weight,@required this.product_id,@required this.variant });

  @override
  _ProductdetailState createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  bool like =false,
  share=false,similar=false;
  
  int _indx =0;

  @override 
  void initState(){

  super.initState();
  fetchlikeditem();
  print(widget.weight);

  }

List<String> likeid;
List<String> listimg;
List<String> listhindiname;
List<String> listenglishname;
List<String> listweight;
List<String> listprice;
List result=[];
var cartitem;
var userid;
var pid,wt,rt;
 addproduct(var itemnumber) async {
    setState(() {
      
      wt = widget.weight;
      rt = widget.price;
      pid = widget.product_id;

    });


String apiUrl = "http://pfv.wonsoft.co.in/API/Post.asmx/ItemAdd?UID=$userid&PID=$pid&Weight=$wt&MRP=$rt&Cnt=$itemnumber";
    print("apiUrl***********88");
    print(apiUrl);
    http.Response response = await http.get(apiUrl);

    result = json.decode(response.body);

    setState(() {
      result = json.decode(response.body);
    });
    print(response.statusCode);

    print(result);


    var newitemnumber = result[0]["ItemCount"];
  print(newitemnumber);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cartitem',newitemnumber);

    setState((){
      cartitem = newitemnumber;
    });


    if (response.statusCode == 200) {
      print(response.statusCode);

     
    } else {
    result = [];
      print("345");
    }
  }




//decrease item number...

 removeproduct(var itemnumber) async {
   
    setState(() {
      
      wt = widget.weight;
      rt = widget.price;
      pid = widget.product_id;

    });


String apiUrl = "http://pfv.wonsoft.co.in/API/Post.asmx/ItemDel?UID=$userid&PID=$pid&Weight=$wt&MRP=$rt&Cnt=$itemnumber";
    print("apiUrl***");
    print(apiUrl);
    http.Response response = await http.get(apiUrl);

    result = json.decode(response.body);

    setState(() {
      result = json.decode(response.body);
    });
    print(response.statusCode);
    print("hii");
    print(result);

   // print(products);
  var newitemnumber = result[0]["ItemCount"];
  print(newitemnumber);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cartitem',newitemnumber);

     setState((){
      cartitem = newitemnumber;
    });

    if (response.statusCode == 200) {
      print(response.statusCode);

      // print(products);
      // print(products.length);

      //print(pendingitem[0]["transaction_uid"]);
    } else {
    result = [];
      print("345");
    }
  }




  fetchlikeditem() async{

      SharedPreferences preferences = await SharedPreferences.getInstance();
      likeid = preferences.getStringList('likeid');
      listimg = preferences.getStringList('listimg');
      listhindiname = preferences.getStringList('listhindiname');
      listenglishname = preferences.getStringList('listenglishname');
      listweight = preferences.getStringList('listweight');
     
      listprice = preferences.getStringList('listprice');
      userid = preferences.getString("Id");
     
     
      print('likedlist');
      print(likeid);
      print('likedlist');
      print(listimg);
      print('likedlist');
      print(listhindiname);
      print('likedlist');
      print(listenglishname);
      print('likedlist');
      print(listweight);
      print('likedlist');
      print(listprice);
      print("userid***********$userid");
     

      setState((){

         cartitem = preferences.getInt("cartitem");

     if(likeid != null){

       print("okk not null");
       print(likeid);
       print(listimg);

      likeid = preferences.getStringList('likeid');
      listimg = preferences.getStringList('listimg');
      listhindiname = preferences.getStringList('listhindiname');
      listenglishname = preferences.getStringList('listenglishname');
      listweight = preferences.getStringList('listweight');
      
      listprice = preferences.getStringList('listprice');
       userid = preferences.getString("Id");
     

     }
     
     if(likeid==null){

       print("null here");

     likeid = [];
      listimg = [];
      listhindiname =[];
      listenglishname = [];
      listweight = [];
      
      listprice = [];

     }

      });

   

  }
 
  Share(){
    return GestureDetector(onTap: (){
      setState(() {
        share=!share;
      });
    },
      child: Row(
        children: [
          Icon(Icons.share,color: Colors.grey,),
          Text("Share",style: TextStyle(color: Colors.black),)
        ],
      ),
    );
  }
  SimilarPrdct(){
    return GestureDetector(onTap: (){
      setState(() {
        similar=!similar;
      });
    },
      child: Row(
        children: [
          Icon(Icons.art_track_sharp,color: Colors.grey,),
          Text("Similar Productdetail",style: TextStyle(color: Colors.black),)
        ],
      ),
    );
  }
  final img ="https://png.pngtree.com/png-clipart/20200701/original/pngtree-red-vegetables-tomatoes-png-image_5428080.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:x,
        title:  Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("   Prerna",style: GoogleFonts.caveatBrush(color: Colors.white,fontSize:33),),


              
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
      ),
      body: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 20,),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                  alignment: Alignment.center,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SizedBox(height: 300,width: 250,
                        child: Image(
                          image: NetworkImage(widget.productimg),fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(margin: EdgeInsets.only(top: 20,bottom: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        GestureDetector(
                          onTap:()async {

setState((){
  like=true;
});
                           likeid.add(widget.product_id.toString());

                            
      listimg.add(widget.productimg.toString());
      listhindiname.add(widget.hindiname.toString());
      listenglishname.add(widget.englishname.toString());
      listweight.add(widget.weight.toString());
      listprice.add(widget.price.toString());

      
      

                            print("ok i liked it");
                            print(likeid);
      print(listimg);
      print(listhindiname);
      print(listenglishname);
      print(listweight);
      print(listprice);
                            

                             SharedPreferences preferences = await SharedPreferences.getInstance();
                             preferences.setStringList('likeid',likeid);
                             preferences.setStringList('listimg',listimg);
                             preferences.setStringList('listhindiname',listhindiname);
                             preferences.setStringList('listenglishname',listenglishname);
                             preferences.setStringList('listweight',listweight);
                             preferences.setStringList('listprice',listprice);

   

                          },
                          child:
                          Icon(Icons.favorite_outlined,color:like?x:Colors.grey)),
                       
                        //Share(),
//                         GestureDetector(
//                           onTap:(){

//  Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Products(
//                                   category_id: category[index]["ID"])));
//                           },
//                           child:SimilarPrdct())
                      ],
                    ),
                  ),
                  Row(
                    children: [    
                       Container(margin: EdgeInsets.only(left: 20),
                          child: Text(widget.englishname,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
                      SizedBox(width:5),Container(margin: EdgeInsets.only(left: 20),
                          child: Text(widget.hindiname,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
                    ],
                  ),
                  Container(margin: EdgeInsets.only(left: 20,top: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(" Price:₹ ${widget.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)),
                        Container(padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(left: 10),
                         // width: 150,
                         // child: dropdown(),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 20),
                        child: Text(widget.weight),
                      ),
                    ],
                  ),
                  Container(height: 80,
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(top:BorderSide(width: 3,color: Colors.grey[300]),bottom: BorderSide(width: 3,color: Colors.grey[300])),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height:10),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10,left: 20),
                              child: Text("Quantity"),
                            ),
                            Container(margin: EdgeInsets.only(top: 10,left: 40),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(onTap:(){
                                    setState(() {
                                      if (_indx ==0)
                                      {
                                        print("null value");
                                      }
                                      else
                                        _indx--;

                                      // y=_indx.toString();
                                    });
removeproduct(_indx.toString());
                                  },
                                    child: Container(margin: EdgeInsets.only(right: 7),
                                        child: Icon(Icons.remove_circle,color: x,)),
                                  ),
                                  Text("$_indx"),
                                  GestureDetector(onTap:(){
                                    setState(() {
                                      _indx++;
                                    });
                                     addproduct(_indx.toString());
                                  },
                                    child: Container(margin: EdgeInsets.only(left: 7),
                                        child: Icon(Icons.add_circle,color: x,)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: 40.0,
              child: RaisedButton(
                child: Text('Go to Cart', style: TextStyle(fontSize:16,color:Colors.white)),
                color: x,
                onPressed: () {

                },
              )
          ),
        ],
        ),
    );
  }
}