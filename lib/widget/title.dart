import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF11392b),
        fontFamily: 'OmegaBolder',
      )
    );
  }
}