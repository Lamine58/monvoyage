import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monvoyage/functions/function.dart';
import 'package:monvoyage/landing.dart';
import 'package:monvoyage/tabs/tabs.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> initializeData() async {
    var userData = await getUser();
    setState(() {
      if(userData!=null){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Tabs(0)),
        );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LangdingPage()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => initializeData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF11392b),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Image.asset(
                      'assets/images/logo-tagah-blanc@300x.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

