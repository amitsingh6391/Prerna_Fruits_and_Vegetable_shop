import 'package:flutter/material.dart';
class faq extends StatefulWidget {
  @override
  _faqState createState() => _faqState();
}

class _faqState extends State<faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("FAQ"),

      ),
      body: SingleChildScrollView(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://pxabay.com/photos/flat-lay-food-dessert-fruits-2583213/"))),
              child: Text("Quick answers to your queries\n",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)),

          Text(" #FAQs\n",style: TextStyle(color: Colors.orange, fontSize: 30,fontWeight: FontWeight.bold),),
          Text("Can I add more than one delivery address in an account? ",style: TextStyle(color: Colors.orange, fontSize: 25),),
          Text("Yes, you can add multiple delivery addresses in your iFresh account. However, remember that all items placed in a single order can only be delivered to one address. If you want different products delivered to different addresses you need to place them as separate orders.",style: TextStyle(fontSize: 18),),
          Text(" How to buy products  ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text(" Click on the grocery you want to buy. Click on add to cart. After selecting all the grocery items you want to buy, click on payment option. There select your mode of payment and confirm your address. After all this, your order will be placed successfully.",style: TextStyle(fontSize: 18),),
          Text("What are the delivery changes",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text(" For Products listed a Rs 100 charge for delivery per order. While, orders of Rs 300 or above are delivered free.",style: TextStyle(fontSize: 18),),
          Text("What is cash on delivery ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text(" If you are not comfortable making an online payment on Prerna app, you can opt for the Cash on Delivery (COD) payment method instead. With COD you can pay in cash at the time of actual delivery of the product at your doorstep, without requiring you to make any advance payment online.",style: TextStyle(fontSize: 18),),
          Text("What is my shopping list? ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text("My Shopping List is a comprehensive list of all the items previously ordered by you on Prerna. This enables you to shop quickly and easily in future. ",style: TextStyle(fontSize:18 ),),
          Text("What are the modes of payment ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text(" Cash On Delivery Paytm/GooglePay/PhonePe Online payment using debit/credit card",style: TextStyle(fontSize: 18),),
          Text("How do i retrieve/reset my Password ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text("You need to click on the “Login” link at the top right corner of the homepage and click on the “Forgot your password” link and enter your registered phone number. A message with a reset password will be sent to your registered phone number. With this, you can change your password. In case of any further issues please contact our customer support team ",style: TextStyle(fontSize: 18),),
          Text("What is My Account?",style:TextStyle(color: Colors.orange,fontSize: 25), ),
          Text("‘My Account’ allows you complete control over your information and transactions on the Prerna app. ",style: TextStyle(fontSize: 18),),
          Text("How do i login ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text("You can Login by clicking on the “Login” link at the top right corner of the homepage of the app & just provide your phone number and password you chose during registration ",style: TextStyle(fontSize: 18),),
          Text("What will happen if your friend also refers to his/her friend? ",style: TextStyle(color: Colors.orange,fontSize: 25),),
          Text("Friend of your friend will get rs. 100 on registration using your friend’s code. He places first order And it gets successfully delivered, then you and your friend will get rs. 50. Friend of friend place more orders and they get successfully delivered, then you will get 1% and your friend will get 2% of the order value.",style: TextStyle(fontSize: 18),)

















        ],

      )
        ,),

    );
  }
}