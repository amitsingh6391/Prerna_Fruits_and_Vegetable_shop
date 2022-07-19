import 'package:flutter/material.dart';
import "package:e_commerce/color.dart";

class privacy extends StatefulWidget {
  @override
  _privacyState createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: x,
        title: Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(margin: EdgeInsets.only(left:10,right:10,top:30),
              child: Text("We understand the privacy of all information you provide is of primary importance. This is why we do everything possible to use it carefully and sensibly. This information is never shared with other   companies or third-party service provider",style: TextStyle(fontSize: 16),)),
          Text("Your identifiable information will be used by our Privacy Policy. To understand our practices, on how we collect, use and disclose your personally identifiable information",style: TextStyle(fontSize: 16),),
          Text("All your transactions are 100% secure when you place an order online at Prerna App. Your personal information is encrypted by using 256-bit Secure Sockets Layer (SSL) encryption technology before being sent over the Internet, which ensures the privacy and high level of security of all your information.",style: TextStyle(fontSize: 16),),
          Text("All our product prices include all applicable statutory taxes, fees and subject to availability.",style: TextStyle(fontSize: 16),),
          Text(" We make every effort to make sure that the pricing and availability of Products on our Prerna app is accurate and up to date. But, rarely, there may be an error on the pricing of a product or an error related to product availability. In such cases, we are not responsible for any typographical errors and we reserve the right to cancel the sale.", style: TextStyle(fontSize: 16),),
          Text("Standard delivery orders will be delivered within 1 to 2 working days. ", style: TextStyle(fontSize: 16),),
          Text("You can make the payment via any one of the following methods of payment: Paytm / BHIM UPI / Phone Pe / Google Pay / Debit Card,Credit Card, Net Banking or Cash on Delivery. But, availability of payment methods must be checked during placement of order. Cash on Delivery is considered as Safe mode of payment. ", style: TextStyle(fontSize: 16), ),
          Text("The information provided on the app is intended for informational purposes only. ",style: TextStyle(fontSize: 16),),
          Text("On our Prerna App all the products images are shown only for conveniences and reference purposes and actual products may vary from the shown image ",style: TextStyle(fontSize: 16),),
          Text(" We disclaim responsibility for any harm to persons resulting from any instructions or Products referred to in the app. We do not warrant that the app or its content will meet your requirements.", style: TextStyle(fontSize: 16),)



        ],
      )

      ),
    );
  }
}