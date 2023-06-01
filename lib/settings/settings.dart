import 'package:flutter/material.dart';
import 'package:monvoyage/auth/login.dart';
import 'package:monvoyage/auth/sign-in.dart';
import 'package:monvoyage/functions/function.dart';
import 'package:monvoyage/widget/title.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../auth/forget-password.dart';

class Settings extends StatefulWidget {

  final BuildContext context;
  Settings(this.context);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  late bool isLoged = false;
  
  @override
  initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    var userData = await getUser();
    setState(() {
      if(userData!=null){
        isLoged = true;
      }
    });
  }

  @override
  Widget build(BuildContext contextPage) {
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
            isLoged==true ? SizedBox() :
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Mes informations"
                  Navigator.push(
                    widget.context,
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
            isLoged==true ? SizedBox() :
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Modifier le mot de passe"
                  Navigator.push(
                    widget.context,
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
            isLoged==true ? SizedBox() :
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  // Naviguer vers la page "Modifier le mot de passe"
                  Navigator.push(
                    widget.context,
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
            isLoged==false ? SizedBox() :
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajouter un rayon de 12.0 pour les coins arrondis
              ),
              child: InkWell(
                onTap: () {
                  removeUser(widget.context);
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