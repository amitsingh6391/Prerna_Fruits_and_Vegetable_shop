import 'package:flutter/material.dart';
import "package:e_commerce/color.dart";
class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:x,
            title:Text("About Us")
        ),
        body:SingleChildScrollView(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(margin: EdgeInsets.only(left:10,right: 10,top:30),
                child: Text("Prerna is a online fruit and vegetable store. We know the value of your time  and we respect your time. Hence we thought of this idea of getting all your daily vegetables and fruits needed in a few button clicks. With over 150 plus products in our category catalog, you will find fresh fruits and vegetables in our App",style:TextStyle(fontSize:16 ),)),
            Text("Supermarkets consume a lot of energy for lighting, air-conditioning and powering their refrigerators and freezers. We bypass these, bringing products to you straight from the wholesaler to your doorstep which cuts down on a lot of carbon emissions generated by the traditional supply chain and also reduces the number of cars on our roads.It is an easy, relaxed and advanced way of shopping for vegetables needed at your place. ",style: TextStyle(fontSize: 16),),
            Text("We deliver Fresh Vegetables and fruits right at your doorstep with proper packaging and safety measures. Pick the most convenient delivery slot to have your grocery delivered. From early morning delivery for early birds, to late-night delivery for people who work the late shift, iFresh caters to every schedule",style: TextStyle(fontSize: 16),),
            Text("We guarantee good delivery and the best quality!",style: TextStyle(fontSize: 16),),
            Text(
              "About Prerna ",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Text("Prerna is Fruit and Vegetable store. With our wide range of groceries available, Prerna is a large online supermarket and online grocery store for all your everyday food needs. We offer you the best quality grocery products which you can buy online and have them delivered to you. Your order will be delivered right to your doorstep. You can pay online using your Debit/Credit card or by cash or Paytm/ Google Pay/ PhonePe on delivery time.",style: TextStyle(fontSize: 16),),
            Text("We provide groceries of superior quality at your doorsteps with 24x7 well packaged delivery. Our main aim is to provide you with farm fresh vegetables online. ",style: TextStyle(fontSize: 16),),
            Text(" Why should I use Prerna app for buying groceries?",style: TextStyle(fontSize: 16),),
            Text("iFresh app allows you to walk away from the drudgery of grocery shopping and welcome an easy relaxed way of browsing and shopping for groceries. Discover new products and shop for all your food and grocery needs from the comfort of your home or office. No more getting stuck in traffic jams, paying for parking, standing in long queues and carrying heavy bags – get everything you need, when you need, right at your doorstep. Food shopping online is now easy as every product on your monthly shopping list, is now available online at iFresh app, India’s best online grocery store. ",style: TextStyle(fontSize: 16),),
            Text("Our Aim",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Text("Prerna is established with the aim to supply fresh vegetables and fruits of superior quality and cash on delivery services. We provide home delivery for all vegetables or fruits. With an over wide range of products, we cover a large variety of products. We have our market all over India and in Future, We would be adding more categories and Franchise",style: TextStyle(fontSize: 16),),
            Text("For registering, first you have to enter the app and click on New user sign in. There you will have to enter your phone number. We will provide you OTP on your registered number through sms. ",style: TextStyle(fontSize: 16),),
            Text("You’ll have to enter that OTP and then you’ll be asked your name, e-mail address, city, Your area,address and password.. After filling all those columns, you can also receive a referral code(you’ll get rs. 100) if your friend suggests your app and he/she provides you with the code. After finishing all columns, you’ll enter our app.",style: TextStyle(fontSize: 16),)



          ],
        ),

        )

    );
  }
}