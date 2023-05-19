import 'package:flutter/material.dart';
import 'package:monvoyage/auth/sign-in.dart';

import 'forget-password.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Color(0xFF11392b),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login-3.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), 
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),Positioned(
                  bottom: 30,
                  left: 20,
                  child: Text(
                    'Connexion',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Téléphone',
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: Icon(Icons.phone),
                      labelStyle: TextStyle(
                        color: Colors.black,
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
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: Icon(Icons.lock),
                      labelStyle: TextStyle(
                        color: Colors.black,
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
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      // Naviguez vers la page de réinitialisation du mot de passe
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword()
                        ),
                      );
                    },
                    child: Text(
                      'Mot de passe oublié?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign:TextAlign.right
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 55,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1b9676),
                      ),
                      child: Text('Se connecter',style: TextStyle(fontSize: 17,color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Vous n'avez pas de compte?"),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () {
                          // Naviguez vers la page d'inscription
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn()
                            ),
                          );
                        },
                        child: Text(
                          'Créer un compte',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // SizedBox(
                  //   height: 55,
                  //   child:ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Color(0xff3b5998),
                  //     ),
                  //     child:Row(
                  //       children : [
                  //         Icon(Icons.facebook_sharp),
                  //         SizedBox(width:10),
                  //         Text('Continuer avec facebook',style: TextStyle(fontSize: 17,color: Colors.white)),
                  //       ]
                  //     )
                  //   ),
                  // ),
                  // SizedBox(height: 16.0),
                  // SizedBox(
                  //   height: 55,
                  //   child:ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Color(0xff000000),
                  //     ),
                  //     child:Row(
                  //       children : [
                  //         Icon(Icons.apple_outlined),
                  //         SizedBox(width:10),
                  //         Text('Continuer avec apple',style: TextStyle(fontSize: 17,color: Colors.white)),
                  //       ]
                  //     )
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
