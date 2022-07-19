import 'package:e_commerce/bottomnavbar.dart';
import 'package:e_commerce/signin/sigin.dart';
import "package:flutter/material.dart";
import "dart:async";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import "color.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Prerna fruits and Vegetables",
      //home:Homescreen(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();

        var email = preferences.getString('email');

        if (email == "logedin") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => main2(),
              ));
        }

        if (email != "logedin") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => sigin(),
              ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: x,
      body: Center(
        child: Text(
          "            Prerna\nFRUITS & VEGETABLES",
          style: GoogleFonts.caveatBrush(color: Colors.white, fontSize: 33),
        ),
      ),
    );
  }
}
