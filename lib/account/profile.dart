import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Profile extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phone;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.phone,
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);
    _emailController = TextEditingController(text: widget.email);
    _addressController = TextEditingController(text: widget.address);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11392b),
        elevation: 0,
        toolbarHeight: 40,
        title: Text('Mes informations',style: TextStyle(fontSize: 15),)
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFF1b9676),
              radius: 50.0,
              child: Text('${widget.firstName[0]}${widget.lastName[0]}',style: TextStyle(fontSize: 30,color: Colors.white)),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'Prénom',
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: Icon(LucideIcons.user),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 45, 32, 32),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                suffixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10), 
                )
              )
            ),
            SizedBox(height: 25),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Nom de famille',
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: Icon(LucideIcons.user),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 45, 32, 32),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                suffixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10), 
                )
              )
            ),
            SizedBox(height: 25),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Adresse e-mail',
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: Icon(FluentIcons.mail_24_regular),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 45, 32, 32),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                suffixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10), 
                )
              )
            ),
            SizedBox(height: 25),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Adresse',
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: Icon(FluentIcons.home_24_regular),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 45, 32, 32),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                suffixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10), 
                )
              )
            ),
            SizedBox(height: 25),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Numéro de téléphone',
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: Icon(FluentIcons.phone_24_regular),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 45, 32, 32),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                suffixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10), // set border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10), 
                )
              )
            ),
          ],
        ),
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
          child: Text('Valider',style: TextStyle(fontFamily: 'Omega',fontSize: 17,fontWeight: FontWeight.w600))
        ),
      )
    );
  }
}
