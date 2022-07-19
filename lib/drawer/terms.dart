import 'package:flutter/material.dart';
import "package:e_commerce/color.dart";
class terms extends StatefulWidget {
  @override
  _termsState createState() => _termsState();
}

class _termsState extends State<terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:x,
        title: Text("Terms & Conditions"),
      ),
      body: SingleChildScrollView(child:
      Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: EdgeInsets.only(left:10),
              child: Column(
                children: [
                  Text("The following are the Terms and Conditions, read together with the Privacy Policy, that govern your buy and use of the products from Prerna app , and constitute a binding agreement between you and Prerna app.",style: TextStyle(fontSize: 16),),
                  Text("By visiting, viewing, accessing or otherwise using any of the services or information created, collected, compiled or submitted to Prerna app, you are deemed to have agreed to all the following Terms and Conditions of Sale/Service. So, before you use this app, please read these terms carefully as you agree to be bound by them. If you do not accept these Terms and Conditions, please do not use the Prerna app. ",style: TextStyle(fontSize: 16),),
                  Text(" To use certain features of the Prerna App (e.g., ordering products, posting rating/reviews), you must set up an account with Prerna App and provide certain information about yourself as prompted by the Customer Information Form, including, your name, email address, account password, mobile phone number and billing/shipping address. All your registration information is protected by our Privacy Policy.",style: TextStyle(fontSize: 16),),
                  Text("You represent and warrant that the information you submit during registration is truthful and accurate and that you will maintain the accuracy of such information.",style: TextStyle(fontSize: 16),),
                  Text("Your Phone number and Password are personal to you. You may not transfer your account and you will be responsible for the activities associated with your Accoun",style: TextStyle(fontSize: 16),),
                  Text("Prerna App will not be liable for any loss or damages as a result of your failure to maintain the confidentiality of your account credentials. If you suspect any unauthorized use of your account, you must immediately notify Prerna App",style: TextStyle(fontSize: 16),),
                  Text("It is your responsibility to keep your email address up-to-date on your account setup at Prerna App so that we can communicate with you electronically.",style: TextStyle(fontSize: 16),),
                  Text("We promise to deliver fresh and quality vegetables. Our health depends on the availability of nutritious fresh vegetables. And today’s busy, health-conscious consumers look for both convenience and quality.",style: TextStyle(fontSize:16),),
                  Text("Wallet Balance for Prerna App- You can buy our products from wallet balance but that balance is not for delivery charges.Any misuse of wallet balance will not be acceptable. We can detect balance if we’ll find any misuse.",style: TextStyle(fontSize: 16),),
                  Text("It is your responsibility to keep your email address up-to-date on your account setup at Prerna App so that we can communicate with you electronically.", style: TextStyle(fontSize: 16),)





                ],

              )
          )
        ],
      )
        ,),







    );
  }
}