import 'package:e_commerce/bottomnavbar.dart';
import 'package:e_commerce/signin/resetpass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

import '../color.dart';
class Otp extends StatefulWidget {
  var otp,mobile;
  Otp({@required this.otp,@required this.mobile});
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  BuildContext scaffoldContext;
var otpwrite;
bool loading=false;
List data;
 @override
  void initState() {
    print(widget.otp);
    print(widget.mobile);
    super.initState();
  }

//forgototpverified.......
var usernumber,userotp;

forgototpverify() async {
    setState(() {
       usernumber = widget.mobile;
       userotp = otpwrite;
      loading = true;
    });

   
    String apiUrl =
        "http://pfv.wonsoft.co.in/API/Post.asmx/ForgotOTPVerify?Mobile=$usernumber&OTP=$userotp";
    print(apiUrl);

    final response = await http.get(apiUrl);

    print(response.statusCode);

    data = json.decode(response.body);

    print("******data*******");
    print(data);

   var status = data[0]["Result"];
    var id = data[0]["ID"];
    print("********id");
    print(id);

    print(response.body);
    if (response.statusCode == 200 && status == "Success") {
      print("ok fine");
      print(response.statusCode);

      setState(() {
        loading = false;
      });

   
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => reset(id:id)));
    } else {
      setState(() {
        loading = false;
      });

      print("internal server error");
      print("345");
        Fluttertoast.showToast(
        msg: "Internal server error",
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
        body:new Builder(builder: (BuildContext context) {
      scaffoldContext = context;
      return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                    children: [
                      Container(alignment: Alignment.topCenter,
                        height: 300,color:x,
                        child: Container(height: 180,alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 30),
                          child: Image(
                            image: AssetImage("assets/WhatsApp Image 2020-11-03 at 2.05.54 PM (1)_preview_rev_1.png"),
                          ),
                        ),
                      ),
                      Container(height: 600,
                        padding: const EdgeInsets.only(top:200.0),
                        child: Center(
                          child: Card(
                            color: Colors.white,
                            elevation: 6.0,
                            margin: EdgeInsets.only(right: 15.0, left: 15.0),
                            child: Container(height: 400,width: 570,
                              child: new Wrap(

                                children: <Widget>[
                                  Center(
                                    child: new Container(
                                      margin: EdgeInsets.only(top: 20.0,bottom: 10),
                                      child: new Text(
                                        'Enter OTP',
                                        style: TextStyle(
                                            fontSize: 25.0, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: new Container(
                                      margin: EdgeInsets.only(left:20,top: 10.0,bottom: 50),
                                      child: new Text(
                                        'Please Enter OTP sent via SMS to your number',
                                        style: TextStyle(
                                            fontSize: 15.0, color:x),
                                      ),
                                    ),
                                  ),
                                  Container(margin: EdgeInsets.only(bottom: 40),color: Colors.transparent,
                                    child:  PinEntryTextField(
                                      onSubmit: (String pin){
                                        setState(() {
                                           otpwrite=pin;
                                        });

                                      }, // end onSubmit
                                    ),
                                  ),
                                  Container(alignment: Alignment.center,
                                    child: ButtonTheme(
                                        minWidth: 200.0,
                                        height: 40.0,
                                        child: RaisedButton(
                                          child: Text('Reset', style: TextStyle(fontSize:16,color:Colors.white)),
                                          color: x,
                                          onPressed: () {
                                            if (widget.otp==otpwrite){

                                              forgototpverify();

                                              


                                            }
                                            else{
                                                                   createSnackBar();
                                            }
                                           
                                          },
                                        )
                                    ),
                                  ),

                                  Container(alignment: Alignment.center,padding: EdgeInsets.only(top: 30,left: 20,right: 10),
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                                        child: Text.rich(
                                          TextSpan(
                                            children: const <TextSpan>[
                                              TextSpan(
                                                  text: 'Verify your registered number and reset your password ',
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
                      )]),
              ],
            ));}));
  }
  void createSnackBar() {
    final snackBar = new SnackBar(content: new Text("Incorrect OTP",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }
}
