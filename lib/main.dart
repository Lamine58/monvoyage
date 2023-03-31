import 'package:flutter/material.dart';
import 'package:monvoyage/splash.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon voyage',
      home: SplashScreen(),
    );
  }
}
