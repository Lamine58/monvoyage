import 'package:flutter/material.dart';
import 'package:monvoyage/tabs/tabs.dart';

class LangdingPage extends StatefulWidget {
  const LangdingPage({Key? key}) : super(key: key);

  @override
  State<LangdingPage> createState() => _LangdingPageState();
}

class _LangdingPageState extends State<LangdingPage> {
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Mon voyage",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Omega',
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Réservez votre ticket en quelques clics",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Omega',
                      ),
                    ),
                    SizedBox(height:90),
                    SizedBox(
                      width: 250, // <-- Your width
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Tabs()),
                          );
                        },
                        child: const Text(
                          'Demarrer',
                          style:TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'OmegaBolder',
                            
                          )
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFF10382a),
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100.0,
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