import 'package:flutter/material.dart';

import '../color.dart';
class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: x,
        title:Text("Notification")
      ),
    body:Container(
    height:MediaQuery.of(context).size.height,color: Colors.transparent,
    )
    );
  }
}
