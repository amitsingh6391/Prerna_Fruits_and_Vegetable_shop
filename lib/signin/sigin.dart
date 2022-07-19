import 'package:e_commerce/bottomnavbar.dart';
import 'package:e_commerce/signin/forgotpass.dart';
import 'package:e_commerce/signup/signup.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color.dart';

class sigin extends StatefulWidget {
  @override
  _siginState createState() => _siginState();
}

class _siginState extends State<sigin> {
  TextEditingController numberEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  final userauth = GlobalKey<FormState>();

  bool issignin = false;
  var number, password;

  List? data;
  bool loading = false;

  signin() async {
    setState(() {
      number = numberEditingController.text;
      password = passwordEditingController.text;
      loading = true;
    });

    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/Login?Mobile=$number&Pwd=$password";
    print(apiUrl);

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      },
    );

    print(response.statusCode);

    data = json.decode(response.body);
    var id = data![0]["Id"];
    var name = data![0]["Name"];

    var cartitem = data![0]["CartItem"];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cartitem', cartitem);
    preferences.setString('Id', id);
    preferences.setString('name', name);
    preferences.setString('number', data![0]["Mobile"]);
    print(id);
    print(name);
    print("******data*******");
    print(data);

    print(response.body);
    if (response.statusCode == 200 && id != "-1") {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => main2()));
    } else {
      print("Someting Wrong");
      print("345");
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(
        msg: "Please provide correct number or Password",
        fontSize: 15,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            color: x,
            child: Container(
              height: 180,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 30),
              child: Image(
                image: AssetImage(
                    "assets/WhatsApp Image 2020-11-03 at 2.05.54 PM (1)_preview_rev_1.png"),
              ),
            ),
          ),
          Container(
            height: 600,
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Card(
                color: Colors.white,
                elevation: 6.0,
                margin: EdgeInsets.only(right: 15.0, left: 15.0),
                child: Container(
                  height: 400,
                  width: 300,
                  child: new Wrap(
                    children: <Widget>[
                      Center(
                        child: new Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: new Text(
                            'Login',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Form(
                          key: userauth,
                          child: Column(
                            children: [
                              new ListTile(
                                leading:
                                    const Icon(Icons.phone_android_outlined),
                                title: new TextFormField(
                                  validator: (val) {
                                    return val!.length > 9
                                        ? null
                                        : "Invalid number";
                                  },
                                  controller: numberEditingController,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    hintText: 'Please enter correct number',
                                    labelText: 'Enter your number',
                                  ),
                                ),
                              ),
                              new ListTile(
                                leading: const Icon(Icons.lock),
                                title: new TextFormField(
                                  obscureText: true,
                                  validator: (val) {
                                    return val!.length > 6
                                        ? null
                                        : "Enter Password 6+ characters";
                                  },
                                  controller: passwordEditingController,
                                  decoration: new InputDecoration(
                                    hintText: 'Please enter password',
                                    labelText: 'Enter Your Password',
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.0, bottom: 30.0, right: 10),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => forgotp()));
                            },
                            child: Text(
                              "Forgot Password ?  ",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ButtonTheme(
                            minWidth: 200.0,
                            height: 40.0,
                            child: RaisedButton(
                              child: Text('SIGN   IN',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              color: x,
                              onPressed: () {
                                if (userauth.currentState!.validate()) {
                                  signin();
                                }
                              },
                            )),
                      ),
                      loading
                          ? Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.green),
                            )
                          : Text(""),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signup()));
                                },
                                child: Text.rich(
                                  TextSpan(
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'NEW USER ? ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: 'REGISTER',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ],
    )));
  }
}
