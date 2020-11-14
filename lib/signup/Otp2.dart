
import "package:e_commerce/services/updatepassword.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

import 'package:e_commerce/color.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp2 extends StatefulWidget {
  var otp, mobilenumber;
  Otp2({@required this.otp, @required this.mobilenumber});
  @override
  _Otp2State createState() => _Otp2State();
}

class _Otp2State extends State<Otp2> {
  @override
  void initState() {
    print(widget.otp);
    print(widget.mobilenumber);
    super.initState();
  }

  var number, otpcode, data;

  bool loading = false;

  otpverification() async {
    setState(() {
      number = widget.mobilenumber;
      otpcode = widget.otp;
      loading = true;
    });

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString('usernumber', number.toString());
    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/OTPVerify?Mobile=$number&OTP=$otpcode";
    print(apiUrl);

    final response = await http.get(apiUrl);

    print(response.statusCode);

    data = json.decode(response.body);
    print("******data*******");
    print(data);

    var y = data[0]["Result"];
    var id = data[0]["ID"];
    print(y);
    print(id);

     SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Id',id);

    print(response.body);
    if (response.statusCode == 200 && y == "Success") {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Setpassword(id: id)));
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

  var enterotp;
  BuildContext scaffoldContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new Builder(builder: (BuildContext context) {
      scaffoldContext = context;
      return SingleChildScrollView(
          child: Column(
        children: [
          Stack(children: [
            Container(alignment: Alignment.topCenter,
              height: 300,color:x,
              child: Container(height: 180,alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 30),
                child: Image(
                  image: AssetImage("assets/WhatsApp Image 2020-11-03 at 2.05.54 PM (1)_preview_rev_1.png"),
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
                    width: 570,
                    child: new Wrap(
                      children: <Widget>[
                        Center(
                          child: new Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 10),
                            child: new Text(
                              'Enter OTP',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),
                            ),
                          ),
                        ),
                        Center(
                          child: new Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 10.0, bottom: 50),
                            child: new Text(
                              'Please Enter OTP sent via SMS to your number',
                              style: TextStyle(fontSize: 15.0, color: x),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 40),
                          color: Colors.transparent,
                          child: PinEntryTextField(
                            onSubmit: (String pin) {
                              setState(() {
                                enterotp = pin;
                              });
                            }, // end onSubmit
                            isTextObscure: true,
                          ),
                        ),

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
                                child: Text('SIGN   IN',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                color: x,
                                onPressed: () {
                                  if (enterotp == widget.otp) {
                                    otpverification();
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => signup2()));
                                  } else {
                                    createSnackBar();
                                  }
                                },
                              )),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.only(top: 30, left: 20, right: 10),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                              child: Text.rich(
                                TextSpan(
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: 'Verify your registered number',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ))
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

  void createSnackBar() {
    final snackBar = new SnackBar(
        content: new Text(
          "Incorrect OTP ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }
}
