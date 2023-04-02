import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widget/custom_radio.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  TextEditingController _controller_start = TextEditingController();
  TextEditingController _controller_end = TextEditingController();
  bool _isSelectedToday = true;
  bool _isSelectedTomorrow = false;
  bool _isSelectedDay = false;
  int site = 1;
  late DateTime _dateSelected =  DateTime.now();
  late String _choisir = 'Choisir';
  
   void _changeLocation() {
    setState(() {

        String start = _controller_start.text;
        String end = _controller_end.text;
        
        _controller_start.text = end;
        _controller_end.text = start;

    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11392b),
        toolbarHeight: 270,
        title: _AppBar(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xfffafafa),
        elevation: 0,
        padding: EdgeInsets.only(bottom: 20,left: 20,right: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            minimumSize: Size(double.infinity, 30),
            backgroundColor:Color(0xFF1b9676),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )
          ),
          onPressed: () {},
          child: Text('Voir les disponibilités',style: TextStyle(fontFamily: 'Omega',fontSize: 17,fontWeight: FontWeight.w600))
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Title(),
              SizedBox(height: 10),
              Row(
                children: [
                  _TodayRadio(),
                  SizedBox(width: 10),
                  _TomorrowRadio(),
                  SizedBox(width: 10),
                  _DateRadio(),
                ],
              ),
              SizedBox(height: 20),
              Divider(height: 1,color: Color.fromARGB(90, 27, 150, 117)),
              _SiteWidget(),
              Divider(height: 1,color: Color.fromARGB(90, 27, 150, 117))
            ],  
          )
        ),
      ),
    );
  }

  _SiteWidget(){

    return Container(
      padding: EdgeInsets.only(top:10,bottom: 10),
      child: Row(
        children: [
          const Icon(LucideIcons.users,color: Color.fromARGB(255, 96, 96, 96),size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "$site personne"+(site>1 ? 's' : ''),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 96, 96, 96),
                fontFamily: 'Omega'
              ),
            )
          ),
          _Minus(),
          Container(
            color: Color(0xFFe3edea),
            child: Center(child: Text('|',style: TextStyle(color: Color.fromARGB(255, 166, 166, 166)))),
            height: 30
          ),
          _Plus()
        ],
      ),
    );
  }

  _Plus(){

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(4),
        minimumSize: Size(50, 30),
        backgroundColor:Color(0xFFe3edea),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(4),topRight:Radius.circular(4)),
        )
      ),
      onPressed: () {
        setState(() {
          site++;
        });
      },
      child: Icon(LucideIcons.plus,size: 17,color: Color(0xFF11392b))
    );
  }

  _Minus(){

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(4),
        minimumSize: Size(50, 30),
        backgroundColor:Color(0xFFe3edea),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4),topLeft:Radius.circular(4)),
        )
      ),
      onPressed: () {
        setState(() {
          if(site>1)
            site--;
        });
      },
      child: Icon(LucideIcons.minus,size: 17,color: Color(0xFF11392b))
    );
  }

  _TodayRadio(){

    return CustomRadio(
      text: "Aujourd'hui",
      icon: const Text(''),
      isSelected: _isSelectedToday,
      selectedBorderColor: Color(0xFF1b9676), // bordure colorée pour l'état sélectionné
      unselectedBorderColor: Color(0xFF4d4d4d), // bordure colorée pour l'état non sélectionné
      onChanged: () {
        setState(() {
          _isSelectedToday = !_isSelectedToday;
          _isSelectedTomorrow = false;
          _isSelectedDay = false;
          print('Today action');
        });
      },
    );

  }

  _TomorrowRadio(){

    return CustomRadio(
      text: "Demain",
      icon: const Text(''),
      isSelected: _isSelectedTomorrow,
      selectedBorderColor: Color(0xFF1b9676), // bordure colorée pour l'état sélectionné
      unselectedBorderColor: Color(0xFF4d4d4d), // bordure colorée pour l'état non sélectionné
      onChanged: () {
        setState(() {
          _isSelectedTomorrow = !_isSelectedTomorrow;
          _isSelectedToday = false;
          _isSelectedDay = false;
          print('Tomorrow action');
        });
      },
    );

  }

  _DateRadio(){

    return CustomRadio(
      text: _choisir,
      icon: LucideIcons.calendarDays,
      isSelected: _isSelectedDay,
      selectedBorderColor: Color(0xFF1b9676), // bordure colorée pour l'état sélectionné
      unselectedBorderColor: Color(0xFF4d4d4d), // bordure colorée pour l'état non sélectionné
      onChanged: () async {
        final date = await _modalCalendar(context);
        setState(() {
          _dateSelected = date==null ? DateTime.now() : date[0];
          _choisir = date==null ? 'Choisir' : DateFormat('dd-MM-yyyy').format(_dateSelected);
          _isSelectedDay = true;
          _isSelectedToday = false;
          _isSelectedTomorrow = false;
          print('Tomorrow action');
        });
      },
    );

  }

  _Title(){

    return Text(
      'Date du voyage',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4d4d4d),
        fontFamily: 'OmegaBolder',
      )
    );

  }



  _AppBar(){
      return Container(
          color: Color(0xFF11392b),
          padding: EdgeInsets.only(top:0,left: 20,right: 20,bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Salut Saint Cyr, ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Omega',
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  )
                ],
              ),
              SizedBox(height: 15),
              Stack(
                  children: [
                    Column(
                      children: 
                       [
                        TextField(
                          controller: _controller_start,
                          cursorColor: Color(0xFFFFFFFF),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Omega',
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF11392b),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF11392b),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFF355c50),
                            hintText: "D'où partez-vous?",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF607e76),
                              fontFamily: 'Omega',
                            )
                          ),
                        ),
                        SizedBox(height: 25),
                        TextField(
                          controller: _controller_end,
                          cursorColor: Color(0xFFFFFFFF),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Omega',
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF11392b),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF11392b),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFF355c50),
                            hintText: "Où allez-vous?",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF607e76),
                              fontFamily: 'Omega',
                            )
                          ),
                        ),
                      ]
                    ),
                    Positioned(
                      right: 0,
                      top: 50,
                      child: 
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the background color to blue
                            borderRadius: BorderRadius.circular(50.0), // Add some rounded corners
                          ),
                          child: IconButton(
                            icon: Icon(LucideIcons.arrowUpDown,color: Color(0xFF11392b)),
                            onPressed: () {
                              this._changeLocation();
                            },
                          ),
                      )
                    )
                  ]
              )
            ],
          ),
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
}

