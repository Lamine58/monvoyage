import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:monvoyage/auth/login.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text('Inscription',style: TextStyle(fontSize: 15)),
        elevation: 0,
        backgroundColor: Color(0xFF11392b),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
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
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      minimumSize: Size(double.infinity, 30),
                      backgroundColor:Color(0xFF1b9676),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Inscription',style: TextStyle(fontFamily: 'Omega',fontSize: 17,fontWeight: FontWeight.w600))
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Vous avez déjà un compte?"),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () {
                          // Naviguez vers la page d'inscription
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login()
                            ),
                          );
                        },
                        child: Text(
                          'Se connecter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
