import 'dart:async';
import 'dart:convert';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:monvoyage/api/api.dart';
import 'package:monvoyage/auth/sign-in.dart';
import 'package:monvoyage/tabs/tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions/function.dart';
import 'forget-password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Api api = new Api();


  Future<void> _setData(response) async {

    final SharedPreferences prefs = await _prefs;

    await prefs.setString('accessToken', response['datas']['accessToken']);
    await prefs.setString('refreshToken', response['datas']['refreshToken']);

    prefs.setString('user', json.encode(response)).then((bool success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Tabs(0)
        ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez saisir votre e-mail';
                            }
                            if(!validateEmail(_email.text)){
                              return 'Veuillez saisir une adresse e-mail valide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: Icon(Icons.mail),
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
                        TextFormField(
                          controller: _password,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Veuillez s'il vous plait entrez votre mot de passe";
                            }
                            return null;
                          },
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
                      ],
                    )
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
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
                      onPressed: () async {
                          
                        if (_formKey.currentState!.validate()) {

                          startLoading(context);
                          var response = await api.post('auth/login', {'email':_email.text,'password':_password.text});
                          stopLoading(context);

                          print(response);

                          if(response['status']==null){
                            openModal(context, 'Echec', "Une erreur c'est produite veuillez réessayer", FluentIcons.globe_desktop_24_regular);
                          }else{
                            if(!response['hasError']){
                              _setData(response);
                            }else{
                              openModal(context, 'Echec', response['message'], FluentIcons.error_circle_24_regular);
                            }
                          }
                          
                          
                        }
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
