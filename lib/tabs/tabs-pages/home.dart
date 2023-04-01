import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  late TextEditingController _controller_start = TextEditingController();
  late TextEditingController _controller_end = TextEditingController();
  
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _Title(),
            ],  
          )
        ),
      ),
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
}