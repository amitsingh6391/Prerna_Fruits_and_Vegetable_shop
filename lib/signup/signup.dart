import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_commerce/signup/Otp2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:e_commerce/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final userauth = GlobalKey<FormState>();
  TextEditingController numberEditingController = new TextEditingController();
  bool loading = false;
  List? data;

  var number;
  otpverification() async {
    setState(() {
      number = numberEditingController.text;
      loading = true;
    });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('usernumber', number.toString());
    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/SignUp?Mobile=$number";
    print(apiUrl);

    final response = await http.get(Uri.parse(apiUrl));

    print(response.statusCode);

    data = json.decode(response.body);
    print("******data*******");
    print(data);

    var y = data![0]["Result"];
    var otp = data![0]["OTP"];
    print(y);

    print(response.body);
    if (response.statusCode == 200 && y == "Success") {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Otp2(otp: otp, mobilenumber: number)));
    } else {
      setState(() {
        loading = false;
      });
      print("Not hirt");
      print("345");
      Fluttertoast.showToast(
        msg:
            "Mobile Number is Allready register Please try with diffrent number.",
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
                          margin: EdgeInsets.only(top: 20.0, bottom: 50),
                          child: new Text(
                            'Verify Your Mobile',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: new ListTile(
                          leading: CountryCodePicker(
                            onChanged: print,
                            initialSelection: 'IN',
                            favorite: ['+91', 'IN'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          title: Form(
                            key: userauth,
                            child: TextFormField(
                              validator: (val) {
                                return val!.length == 10
                                    ? null
                                    : "Please enter correct number";
                              },
                              controller: numberEditingController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: new InputDecoration(
                                hintText: 'Enter your mobile number',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 10),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                            child: Text.rich(
                              TextSpan(children: const <TextSpan>[
                                TextSpan(
                                    text:
                                        'We will send you an OTP on this mobile number to verify ',
                                    style: TextStyle(fontSize: 16.0, color: x)),
                              ]),
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
                              child: Text('SIGN   IN',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              color: x,
                              onPressed: () {
                                if (userauth.currentState!.validate()) {
                                  otpverification();
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
    )));
  }
}
