import 'package:flutter/material.dart';
import 'package:monvoyage/auth/login.dart';
import 'package:monvoyage/auth/sign-in.dart';
import 'package:monvoyage/widget/title.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../account/password.dart';
import '../auth/forget-password.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11392b),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitlePage('Paramètres'),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Mes informations"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login()
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.logIn),
                      SizedBox(width: 16.0),
                      _BoxTitle('Connexion')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Modifier le mot de passe"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                     Icon(LucideIcons.users),
                      SizedBox(width: 16.0),
                      _BoxTitle('Inscription')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Modifier le mot de passe"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPassword(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.key),
                      SizedBox(width: 16.0),
                      _BoxTitle('Mot de passe oublié')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Modifier le mot de passe"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login()
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.logOut),
                      SizedBox(width: 16.0),
                      _BoxTitle('Deconnexion')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _BoxTitle(string){

    return Text(
      string,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w200,
        fontFamily: 'Omega',
      )
    );
  }

}