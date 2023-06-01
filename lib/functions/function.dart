import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monvoyage/tabs/tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../class/user.dart';

bool validateEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );

  return emailRegExp.hasMatch(email);
}

primaryColor(){
  return const Color(0xFF11392b);
}

defaultColor(){
  return const Color(0xFF11392b);
}

textColor(){
  return const Color(0xFF11392b);
}

secondaryColor(){
  return const Color(0xFF1b9676);
}

grayColor(){
  return const Color(0xFFe5e7ed);
}

paddingTop(double height){
  return SizedBox(height: height);
}

paddingLeft(double width){
  return SizedBox(width: width);
}

Future<void> removeUser(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
  await prefs.remove('refreshToken');
  prefs.remove('user').then((value) => {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Tabs(0)),
    )
  });
}

getUser() async {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;

  if(prefs.getString('user')!=null){
    return User.fromJson(json.decode(prefs.getString('user')!));
  }else{
    return null;
  }
  
}


getRefreshToken() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  return prefs.getString('refreshToken');
}


getToken() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  return prefs.getString('accessToken');
}
  

openModalError(context,String title,subtitle,icon){
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.only(left:16,right:16,bottom: 0,top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,color: primaryColor(),size: 70),
              paddingTop(5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              paddingTop(5),
              Column(children: subtitle),
              paddingTop(7),
              TextButton(
                child: Text('Fermer',style: TextStyle(fontSize: 17,color: primaryColor())),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
  });
}


openModal(context,String title,subtitle,icon){
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.only(left:16,right:16,bottom: 0,top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,color: primaryColor(),size: 70),
              paddingTop(5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              paddingTop(5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              paddingTop(7),
              TextButton(
                child: Text('Fermer',style: TextStyle(fontSize: 17,color: primaryColor())),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
  });
}

closeModal(context){
  Navigator.pop(context);
}

startLoading(context){

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: secondaryColor(),
              ),
              paddingLeft(20),
              const Expanded(
                child:  Text("Veuillez patienter ...",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,fontFamily: 'RobotoLight'))
              ),
            ],
          ),
        ),
      );
    },
  );

}

stopLoading(context){
  Navigator.pop(context);
}

statusBar(color){
  return AppBar(
    elevation: 0,
    backgroundColor: color,
    toolbarHeight: 0,
  );
}