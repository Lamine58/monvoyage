import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11392b),
        elevation: 0,
        toolbarHeight: 0
      ),
      body: Container(
        color: Colors.white,
        child: Text('Tabs view'),
      )
    );
  }
}