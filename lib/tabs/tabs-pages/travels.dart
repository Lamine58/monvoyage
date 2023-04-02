import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class Travels extends StatefulWidget {
  const Travels({Key? key}) : super(key: key);

  @override
  State<Travels> createState() => _TravelsState();
}

class _TravelsState extends State<Travels> {

  @override
  late DateTime _dateSelected =  DateTime.now();
  final DateFormat formatter = DateFormat('dd MMMM yyyy', 'fr');


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11392b),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title(),
            SizedBox(height: 20),
            _selectDate(),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: _items(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _items(){
    return Column(
      children: [
        _item('13:06 24.03.2023', 'Bouaké', 1),
        _item('16:00 30.08.2023', 'Abidjan', 0),
      ],
    );
  }

  _item(date,location,state){

    return Container(
      padding: EdgeInsets.only(top:20,bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.4,
            color: Color.fromARGB(255, 222, 222, 222),
            style: BorderStyle.solid,
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xffe1fad6),
            ),
            child: Icon(FluentIcons.vehicle_bus_24_filled, color: Color(0xff606c5c)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(date),
              ],
            ),
          ),
          SizedBox(width: 16),
          state==1 ? Text('Terminé') : Text('Annulé',style: TextStyle(color: Color(0xfffc716e))),
          SizedBox(width: 20),
          Icon(FluentIcons.chevron_right_24_filled, color: Color(0xff606c5c),size: 20),
        ],
      ),
    );

  }

  _Title(){

    return Text(
      'Mes voyages',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF11392b),
        fontFamily: 'OmegaBolder',
      )
    );

  }

  _modalCalendar(BuildContext context){

    return showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        selectedDayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        selectedDayHighlightColor: Color(0xFF11392b),
        centerAlignModePicker: true,
        customModePickerIcon: SizedBox(),
        firstDate: DateTime.now(),
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
      value: [_dateSelected],
      
    );

  }

  _selectDate(){
    return GestureDetector(
      child: Row(
        children: [
          Text(
            formatter.format(_dateSelected),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 47, 47, 47),
              fontFamily: 'OmegaBolder',
            )
          ),
          SizedBox(width: 3),
          Padding(
            padding: EdgeInsets.only(bottom:5),
            child: const Icon(LucideIcons.chevronDown,size: 20),
          )
        ],
      ),
      onTap: () async {
        final date = await _modalCalendar(context);
        setState(() {
          _dateSelected = date==null ? DateTime.now() : date[0];
        });
      },
    );
  }
}