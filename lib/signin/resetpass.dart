import 'package:e_commerce/signin/sigin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_commerce/color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import '../color.dart';

class reset extends StatefulWidget {
  var id;
  reset({required this.id});
  @override
  _resetState createState() => _resetState();
}

class _resetState extends State<reset> {
  late BuildContext scaffoldContext;
  final userauth = GlobalKey<FormState>();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController repasswordEditingController =
      new TextEditingController();

  @override
  void initState() {
    print(widget.id);
    super.initState();
  }

  var password, userid;
  bool loading = false;
  updatepassword() async {
    setState(() {
      password = passwordEditingController.text;
      userid = widget.id;
      loading = true;
    });

    print("userud************");
    print(userid);

    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/UpdatePwd?ID=$userid&Pwd=$password";
    print(apiUrl);

    final response = await http.get(Uri.parse(apiUrl));

    print(response.statusCode);

    List data = json.decode(response.body);
    print("******data*******");
    print(data);

    var y = data[0]["Status"];

    print(y);
    print(widget.id);

    print(response.body);
    if (response.statusCode == 200 && y == "Done") {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
      });

      Fluttertoast.showToast(
        msg: "Your password is updated Please log in..",
        fontSize: 15,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => sigin()));
    } else {
      setState(() {
        loading = false;
      });
      print("Not hirt");
      print("345");
      Fluttertoast.showToast(
        msg: "Internal Server Error...",
        fontSize: 15,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new Builder(builder: (BuildContext context) {
      scaffoldContext = context;
      return SingleChildScrollView(
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
                            margin: EdgeInsets.only(top: 20.0, bottom: 50),
                            child: new Text(
                              'Reset Password',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Form(
                              key: userauth,
                              child: Column(
                                children: [
                                  ListTile(
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
                                        labelText: 'Enter new Password',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  new ListTile(
                                    leading: const Icon(Icons.lock),
                                    title: new TextFormField(
                                      obscureText: true,
                                      validator: (val) {
                                        return repasswordEditingController
                                                    .text ==
                                                passwordEditingController.text
                                            ? null
                                            : "Your Password not matched";
                                      },
                                      controller: repasswordEditingController,
                                      decoration: new InputDecoration(
                                        hintText: 'Please renter password',
                                        labelText: 'Confirm Password',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        loading
                            ? Center(
                                child: CircularProgressIndicator(
                                    backgroundColor: Colors.green),
                              )
                            : Text(""),
                        Container(
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: 200.0,
                              height: 40.0,
                              child: RaisedButton(
                                child: Text('Confirm',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                color: x,
                                onPressed: () {
                                  if (userauth.currentState!.validate()) {
                                    updatepassword();

                                    // createSnackBar();

                                  }
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ],
      ));
    }));
  }

  void Validate() {
    if (userauth.currentState!.validate()) {
      createSnackBar();
    }
  }

  void createSnackBar() {
    final snackBar = new SnackBar(
        content: new Text(
          "Password Set successfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: snackbar);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);

    // Timer(
    //   Duration(seconds:2),
    //   () {
    //     Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => sigin()));
    //   },
    // );
  }
}
