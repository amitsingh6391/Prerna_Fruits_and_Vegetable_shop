import 'package:e_commerce/bottomnavbar.dart';
import 'package:e_commerce/signin/forgotpass.dart';
import 'package:e_commerce/signin/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce/color.dart';
import 'package:geolocator/geolocator.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  Position _currentPosition;
  bool check = false;
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController nameEditingController = new TextEditingController();
  TextEditingController addressEditingController = new TextEditingController();
  TextEditingController pincodeEditingController = new TextEditingController();
  TextEditingController repasswordEditingController =
  new TextEditingController();
  TextEditingController codeEditingController = new TextEditingController();
  final userauth = GlobalKey<FormState>();



  var lat, long;
  bool loading = false;

  var name, email, mobile, address, city, area, pincode, gender,userid;

  // signup2() async {
  //   if (userauth.currentState.validate()) {
  //     setState(() {
  //       userid = widget.id;
  //       loading = true;
  //     });
  //
  //     print("*************userid");
  //     print(userid);
  //
  //     profileupdate();
  //   } else {
  //     print("something wrong");
  //   }
  // }

//User details should be update here ..
  List
  data; //data is list which we should recive in response of update api function/...
  // bool loading = false;
  int selectedRadioTile, selectedRadio;

  profileupdate() async {
    setState(() {
      name = nameEditingController.text;
      email = emailEditingController.text;
      address = addressEditingController.text;
      pincode =pincodeEditingController.text;
    });
    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/Update?ID=$userid&Name=$name&Gender=$gender&Email=$email&Mobile=$mobile&City=$city&Area=$area&Pincode=$pincode&Address=$address&Latitude=$lat&Longitude=$long";
    print(apiUrl);

    final response = await http.get(apiUrl);

    print(response.statusCode);

    data = json.decode(response.body);
    print("******data*******");
    print(data);

    print(response.body);
    if (response.statusCode == 200) {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) => main2()));
    } else {
      print("Not hirt");
      print("345");
    }
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        lat = _currentPosition.latitude;
        long = _currentPosition.longitude;
      });
    }).catchError((e) {
      print(e);
    });
  }


//getcity and area list...

  List list_of_city=["jodphur"];
  List selectarea =[];

  getcity() async {

    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/City";
    print(apiUrl);

    final response = await http.get(apiUrl);

    print(response.statusCode);

    list_of_city = json.decode(response.body);
    print("*****city*******");
    print(list_of_city);

    print(response.body);
    if (response.statusCode == 200) {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
        list_of_city=list_of_city;

      });




    } else {
      print("Not hirt");
      print("345");
    }
  }









  //fine user mobile number ......

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      mobile = preferences.getString('usernumber');
    });
    print("*******initmobile********");
    print(mobile);
  }

  void initState() {
    super.initState();
    // print("**************id*************");
    // print(widget.id);

    _getCurrentLocation();
    getcity();
    getdata();
    selectedRadio = 0;
    selectedRadioTile = 0;


  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(alignment: Alignment.topCenter,
                  height: 150,color:x,
                  child: Container(height: 180,alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 30),
                    child: Image(
                      image: AssetImage("assets/WhatsApp Image 2020-11-03 at 2.05.54 PM (1)_preview_rev_1.png"),
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Card(
                      color: Colors.white,
                      elevation: 6.0,
                      margin: EdgeInsets.only(right: 15.0, left: 15.0),
                      child: GestureDetector(
                        child: ListView(physics:NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical, children: [
                          Container(
                            width: 300,
                            child: new Wrap(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                                  child: Form(
                                      key: userauth,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          new TextFormField(
                                            validator: (val) {
                                              return val.length > 1
                                                  ? null
                                                  : "Enter your name";
                                            },
                                            controller: nameEditingController,
                                            decoration: new InputDecoration(
                                              hintText: 'Enter your name',
                                              labelText: 'Name',
                                            ),
                                          ),
                                          TextFormField(
                                            validator: (val) {
                                              return RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(val)
                                                  ? null
                                                  : "Please Enter Correct Email";
                                            },
                                            controller: emailEditingController,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: new InputDecoration(
                                              hintText: 'enter your Email',
                                              labelText: 'Email',
                                            ),
                                          ),

                                          TextFormField(

                                            keyboardType: TextInputType.number,

                                            validator: (val) {
                                              return val.length== 6
                                                  ? null
                                                  : "Please Correct Your Pincode";
                                            },
                                            controller: pincodeEditingController,
                                            decoration: new InputDecoration(
                                              hintText: 'Pincode',
                                              labelText: 'Pincode',
                                            ),
                                          ),
                                          Container(margin:EdgeInsets.only(top:25,bottom: 15),
                                            child: TextFormField(
                                              validator: (val) {
                                                return val.length > 1
                                                    ? null
                                                    : "Enter your address";
                                              },
                                              controller: addressEditingController,
                                              decoration: new InputDecoration(
                                                hintText: 'Enter your address',
                                                labelText: 'Address',
                                              ),
                                            ),
                                          ),




//for gender...


                                          // Text("Gender",
                                          //     style: TextStyle(
                                          //       fontSize: 15,
                                          //       fontWeight: FontWeight.bold,
                                          //       // color: back
                                          //     )),
                                          // SizedBox(height: 10),
                                          // RadioListTile(
                                          //   value: 1,
                                          //   groupValue: selectedRadioTile,
                                          //   title: Text("Male"),
                                          //   onChanged: (val) {
                                          //     print("yes");
                                          //     setState(() {
                                          //       gender = "Male";
                                          //     });
                                          //     print("male");
                                          //     setSelectedRadioTile(val);
                                          //   },
                                          //   activeColor: Colors.blue,
                                          //   selected: false,
                                          // ),
                                          // RadioListTile(
                                          //   value: 2,
                                          //   groupValue: selectedRadioTile,
                                          //   title: Text("Female"),
                                          //   onChanged: (val) {
                                          //     setState(() {
                                          //       gender = "Female";
                                          //     });
                                          //     print("female");
                                          //     setSelectedRadioTile(val);
                                          //   },
                                          //   activeColor: Colors.blue,
                                          //   selected: false,
                                          // ),



                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: DropdownButton(
                                              hint: Text(
                                                  'Please Select Your City'), // Not necessary for Option 1
                                              value: city,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  city = newValue;
                                                });
                                              },
                                              items: list_of_city.map((location) {
                                                return DropdownMenuItem(
                                                  child: new Text(location),
                                                  value: location,
                                                );
                                              }).toList(),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: DropdownButton(
                                              hint: Text(
                                                  'Please Select Your Area'), // Not necessary for Option 1
                                              value:area,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  area = newValue;
                                                });
                                              },
                                              items: list_of_city.map((location) {
                                                return DropdownMenuItem(
                                                  child: new Text(location),
                                                  value: location,
                                                );
                                              }).toList(),
                                            ),
                                          ),

                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                loading
                                    ? Center(
                                  child: CircularProgressIndicator(
                                      backgroundColor: Colors.green),
                                )
                                    : Text(""),
                                Container(alignment: Alignment.center,
                                  child: ButtonTheme(
                                      minWidth: 200.0,
                                      height: 40.0,
                                      child: RaisedButton(
                                        child: Text('Update',
                                            style: TextStyle(
                                                fontSize: 16, color: Colors.white)),
                                        color: x,
                                        onPressed: () {
                                          // if (userauth.currentState.validate()) {
                                          //   if (check == true) {
                                          //     signup2();
                                          //   }
                                          // }
                                        },
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                    // onPressed: (){
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>reset(),
                                      //     ));
  //                                  },
  child: Text("Change Password ?",style: TextStyle(color: x),),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                if (_currentPosition != null)
                                  Text(
                                      "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
                              ],
                            ),
                          ),
                        ]),
                        onTap: () {
                          _getCurrentLocation();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

