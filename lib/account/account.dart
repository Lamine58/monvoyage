import 'package:flutter/material.dart';
import 'package:monvoyage/account/password.dart';
import 'package:monvoyage/account/profile.dart';
import 'package:monvoyage/widget/title.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Account extends StatelessWidget {
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
            TitlePage('Mon compte'),
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
                      builder: (context) => Profile(
                        firstName:'Saint',
                        lastName:'Cyr',
                        email:'saintcyr@gmail.com',
                        address:'Rivera',
                        phone:'0102030405',
                      )
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.users),
                      SizedBox(width: 16.0),
                      _BoxTitle('Mes informations')
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
                      builder: (context) => Password(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.key),
                      SizedBox(width: 16.0),
                      _BoxTitle('Modifier le mot de passe')
                    ],
                  ),
                ),
              ),
            ),
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