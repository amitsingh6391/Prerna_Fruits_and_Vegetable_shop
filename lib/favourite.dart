import 'package:e_commerce/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:e_commerce/productdetail.dart";
import "package:e_commerce/cart.dart";
import 'package:shared_preferences/shared_preferences.dart';


class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 45,
        width:MediaQuery.of(context).size.width,
        child: Container(margin: EdgeInsets.only(left: 10,right: 10),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.white,width: 1)),
          child: TextField(
            decoration: new InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.grey,),
              prefixText: ' ',
              prefixIcon: Icon(Icons.search,color: Colors.black,),
            ),
          ),
        )
    );
  }
}
class favourite extends StatefulWidget {
  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {


 @override 
  void initState(){

  super.initState();
  fetchlikeddata();

  }
List<String> likeid;
List<String> listimg;
List<String> listhindiname;
List<String> listenglishname;
List<String> listweight;
List<String> listprice;

int _indx =0;
var cartitem;
 fetchlikeddata() async{

      SharedPreferences preferences = await SharedPreferences.getInstance();
      likeid = preferences.getStringList('likeid');
      listimg = preferences.getStringList('listimg');
      listhindiname = preferences.getStringList('listhindiname');
      listenglishname = preferences.getStringList('listenglishname');
      listweight = preferences.getStringList('listweight');
     
      listprice = preferences.getStringList('listprice');
     
     
      print('likedlist');
      print(likeid);
      

      setState((){

     

       print("okk not null");
       print(likeid);
       print(listimg);

      likeid = preferences.getStringList('likeid');
      listimg = preferences.getStringList('listimg');
      listhindiname = preferences.getStringList('listhindiname');
      listenglishname = preferences.getStringList('listenglishname');
      listweight = preferences.getStringList('listweight');
      
      listprice= preferences.getStringList('listprice');
      cartitem = preferences.getInt("cartitem");

      

 

      });

   

  }


  @override 
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
      return
        Scaffold(appBar: PreferredSize( preferredSize: const Size.fromHeight(100),
          child: AppBar(flexibleSpace:
          Column(
            children: [
              Container(margin: EdgeInsets.only(top: 30,left: 40,right: 20,bottom: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Prerna fruits and Vegetables",style: GoogleFonts.caveatBrush(color: Colors.white,fontSize:20),),


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
                                      fontSize: 10)))
                        ],
                      )
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBar()
                ],
              )
            ],
          ),
            backgroundColor:x,
          ),
        ),
            body:likeid.length<1?Center(
      child: Text("NO Favourite found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
        ):ListView.builder(
           shrinkWrap : true,
        physics: ScrollPhysics(),
        itemCount:listimg.length,
        itemBuilder:(BuildContext context, int index){

         

          return  Card(
              child:GestureDetector(
                
                onTap: ()
             {
                

                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Productdetail(
                                    product_id: likeid[index],
                                    productimg: listimg[index],
                                    hindiname: listhindiname[index],
                                    englishname:listenglishname[index],
                                    price: listprice[index],
                                    weight: listweight[index],
                                    variant: listprice[index])));
   
               
              },
                 child: Card(
                  
                child: Container(
                  height:size.height*0.13,color: Colors.white,
                  child: Column(
                    children: [
                     
                      Row(
                        children: [
                          Container(width: 135,height: 100,
                          child:  Row(
                            
                           
                            children: [
                              Container(height: 100,width: 100,margin: EdgeInsets.only(left: 20),
                                  child: Image(
                                      image: NetworkImage(listimg[index]),fit: BoxFit.fill)
                              ),
                            ],
                          ),),

                          SizedBox(width:10),
                         
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children:[
                                 Text(listenglishname[index].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width:10),
                                  Text(listhindiname[index].toString(),style: TextStyle(color: Colors.black45),
                                  ),

                                  SizedBox(width:20),

                                  //Spacer(),

                                  

                                 
                                  

                              ]),

                              SizedBox(height:10),
                             
                          
                              Row(
                                children:[
                                  Text("M.R.P : "),
                                  Text(listprice[index].toString(),style: TextStyle(color: Colors.black45),
                                  ),
                                 
                                 
                                  ]),
                                  SizedBox(height:10),

                                  Row(children:[

                                     Container(margin: EdgeInsets.only(bottom: 30,right: 100),
                                  child: Text(listweight[index].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),

                                      IconButton(
                                    icon:Icon(Icons.delete,color:x),
                                    onPressed:() async{


                                        likeid.remove(likeid[index].toString());

                            
      listimg.remove(listimg[index].toString());
      listhindiname.remove(listhindiname[index].toString());
      listenglishname.remove(listenglishname[index].toString());
      listweight.remove(listweight[index].toString());
      listprice.remove(listprice[index].toString());

      
      

                            print("ok i delete it");
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


                             Navigator.push(context,MaterialPageRoute(builder:(context)=>favourite()));

                           

                                    }
                                  )

                                  ]),
                              
                             
                             
                            
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
                )
          );

        }

        )
        );
   
  }
}