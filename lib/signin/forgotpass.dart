import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_commerce/signin/otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import '../color.dart';

class forgotp extends StatefulWidget {
  @override
  _forgotpState createState() => _forgotpState();
}

class _forgotpState extends State<forgotp> {
  final userauth = GlobalKey<FormState>();
  TextEditingController numberEditingController = new TextEditingController();

  var number;
  bool loading = false;
  List? data;
  late BuildContext scaffoldContext;

  forgototp() async {
    setState(() {
      number = numberEditingController.text;
      loading = true;
    });

    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/Forgot?Mobile=$number";
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

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(otp: otp, mobile: number)));
    } else {
      setState(() {
        loading = false;
      });

      print("number not registered");
      print("345");
      Fluttertoast.showToast(
        msg: "number not registered",
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
                            'Forgot Password ?',
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
                                hintText: 'Please enter correct number',
                              ),
                            ),
                          ),
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
                              child: Text('Verify',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              color: x,
                              onPressed: () {
                                if (userauth.currentState!.validate()) {
                                  forgototp();

                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => Otp()));
                                } else {
                                  print("weong");
                                  Fluttertoast.showToast(
                                    msg: "Your number is not registerd",
                                    fontSize: 15,
                                    backgroundColor: snackbar,
                                    toastLength: Toast.LENGTH_LONG,
                                    textColor: Colors.white,
                                  );
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
                                      text:
                                          'Verify your registered number and reset your password ',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
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
    )));
  }

  void createSnackBar(context) {
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
