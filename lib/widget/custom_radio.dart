import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomRadio extends StatefulWidget {
  final String text;
  final icon;
  final bool isSelected;
  final VoidCallback onChanged;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;

  CustomRadio({
    required this.text,
    required this.icon,
    required this.onChanged,
    this.isSelected = false,
    this.selectedBorderColor = Colors.blue,
    this.unselectedBorderColor = Colors.grey,
  });

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {

  late double _width = 0;

  prefix(){

    if(widget.icon.runtimeType.toString()=='LucideIconData'){
      _width = 7;
      return Icon(
        widget.icon as IconData?,
        color: widget.isSelected ? Color(0xFF1b9676) : Color(0xFF4d4d4d),
        size: 20,
      );
    }else{
      return const Text('');
    }

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged,
      child: Container(
        padding: EdgeInsets.only(top:7,bottom:7,left: 15,right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: widget.isSelected ? widget.selectedBorderColor : widget.unselectedBorderColor,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            prefix(),
            SizedBox(width: _width),
            Text(
              widget.text,
              style: TextStyle(
                color: widget.isSelected ? Color(0xFF1b9676) : Color(0xFF4d4d4d),
                fontWeight: FontWeight.bold,
                fontFamily: widget.isSelected ? 'OmegaBolder' : 'Omega',
              ),
            ),
          ],
        ),
      ),
    );
  }
}