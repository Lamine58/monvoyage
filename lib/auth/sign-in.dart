import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:monvoyage/api/api.dart';
import 'package:monvoyage/auth/login.dart';
import 'package:monvoyage/auth/otp.dart';
import '../functions/function.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

enum Gender { homme, femme }

class _SignInState extends State<SignIn> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _telephone = TextEditingController();
  final _password = TextEditingController();
  final _confirmationPassword = TextEditingController();
  Gender? _character = Gender.homme;
  late Api api = new Api();

  final _formKey = GlobalKey<FormState>();


  Future<void> _setData(response) async {

    final SharedPreferences prefs = await _prefs;

    setState(() {
      prefs.setString('email', response['datas']['email']).then((bool success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp()
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _fullname.dispose();
    _email.dispose();
    _telephone.dispose();
    _password.dispose();
    _confirmationPassword.dispose();
    super.dispose();
  }

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
                child: Form(
                key: _formKey,
                child :  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _fullname,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre nom et votre prénoms';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nom et prénoms',
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
                      paddingTop(16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                           Expanded(
                            child: Text(
                              'Genre',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color.fromARGB(255, 154, 154, 154)
                              )
                            ),
                          )
                        ]
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor:primaryColor(),
                                value: Gender.homme,
                                groupValue: _character,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              const Text(
                                'Homme',
                                style: TextStyle(
                                  fontFamily: 'Roboto'
                                )
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor:primaryColor(),
                                value: Gender.femme,
                                groupValue: _character,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              const Text(
                                'Femme',
                                style: TextStyle(
                                  fontFamily: 'Roboto'
                                )
                              )
                            ],
                          )
                        ],
                      ),
                      paddingTop(16),
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
                          suffixIcon: Icon(LucideIcons.mail),
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
                      paddingTop(16),
                      TextFormField(
                        controller: _telephone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre numéro de téléphone';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Téléphone',
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: Icon(LucideIcons.smartphone),
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
                      paddingTop(16),
                      TextFormField(
                        controller: _password,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez votre mot de passe';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: Icon(LucideIcons.lock),
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
                      paddingTop(16),
                      TextFormField(
                        controller: _confirmationPassword,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez à nouveau saisir votre mot de passe';
                          }
                          if (value!=_password.text) {
                            return 'Les mots de passes sont differents';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirmation du mot de passe',
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: Icon(LucideIcons.lock),
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
                      paddingTop(30),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            
                            startLoading(context);
                            var response = await api.post('auth/register', {'fullname':_fullname.text,'email':_email.text,'telephone':_telephone.text,'password':_password.text,'confirmationPassword':_confirmationPassword.text,'gender':_character.toString().split('.').last});
                            stopLoading(context);
                            
                            print(response);

                            if(response['status']==null){
                              openModal(context, 'Echec', "Une erreur c'est produite veuillez réessayer", FluentIcons.globe_desktop_24_regular);
                            }else{
                              if(!response['hasError']){
                                _setData(response);
                              }else{

                                if(response['message'].runtimeType==List<dynamic>){

                                  List<Widget> errors = [];
                                  
                                  response['message'].forEach((message) {
                                    errors.add(
                                      Text(
                                        message,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        )
                                      )
                                    );
                                  });

                                  openModalError(context, 'Echec', errors, FluentIcons.error_circle_24_regular);

                                }else{
                                  openModal(context, 'Echec', response['message'], FluentIcons.error_circle_24_regular);
                                }

                              }
                            }

                          }
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
                  )
                )
            ),
          ],
        ),
      ),
    );
  }
}