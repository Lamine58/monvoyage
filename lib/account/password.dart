import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKey = GlobalKey<FormState>();
  late String _oldPassword;
  late String _newPassword;
  late String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11392b),
        elevation: 0,
        toolbarHeight: 40,
        title: Text('Mot de passe',style: TextStyle(fontSize: 15),)
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:   Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Ancien mot de passe',
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: Icon(LucideIcons.key),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre ancien mot de passe';
                  }
                  // Vérifie si le mot de passe correspond à l'ancien mot de passe
                  // Retourne une erreur si les mots de passe ne correspondent pas
                  if (value != _oldPassword) {
                    return 'Le mot de passe ne correspond pas';
                  }
                  return null;
                },
                onSaved: (value) {
                  _oldPassword = value!;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nouveau mot de passe',
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: Icon(LucideIcons.key),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nouveau mot de passe';
                  }
                  // Vérifie si le mot de passe est assez fort
                  // Retourne une erreur si le mot de passe est faible
                  if (value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPassword = value!;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmer le nouveau mot de passe',
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: Icon(LucideIcons.key),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez confirmer votre nouveau mot de passe';
                  }
                  // Vérifie si le mot de passe de confirmation correspond au nouveau mot de passe
                  // Retourne une erreur si les mots de passe ne correspondent pas
                  if (value != _newPassword) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value!;
                },
              )
            ],
          ),
        )
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
