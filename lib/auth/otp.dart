import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:monvoyage/api/api.dart';
import 'package:monvoyage/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:monvoyage/functions/function.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  late Api api = new Api();
  int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  String _email = "";
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController = new TextEditingController(text: "");
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _email = prefs.getString('email')!;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: grayColor(),
    );
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode()async {

    var response = await api.post('auth/account/confirmation', {'code':_otpCode,'email':_email});

    if(response['status']==null){
      openModal(context, 'Echec', "Une erreur c'est produite veuillez réessayer", FluentIcons.globe_desktop_24_regular);
    }else{
      print(response);
      if(!response['hasError']){
         showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.only(left:16,right:16,bottom: 0,top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FluentIcons.checkbox_person_24_filled,color: primaryColor(),size: 70),
                    paddingTop(5),
                    Text(
                      'Compte validé',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    paddingTop(5),
                    Text(
                      response['datas'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    paddingTop(7),
                    TextButton(
                      child: Text('Se connecter',style: TextStyle(fontSize: 17,color: primaryColor())),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  ],
                ),
              ),
            );
        });
      }else{
        openModal(context, 'Echec', response['message'], FluentIcons.error_circle_24_regular);
      }
    }
    
    setState(() {

      _isLoadingButton = false;
      _enableButton = true;
      _otpCode = '';

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor(),
          toolbarHeight: 40,
          elevation: 0,
          title: Text(
            'Confirmation de compte',
            style: TextStyle(
              fontSize: 15.5
            ),
          ),
        ),
        backgroundColor: primaryColor(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo-tagah-blanc@300x.png', width: 150),
                  paddingTop(25),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Veuillez saisir le code à 6 chiffres que vous avez reçu par mail au ',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: _email,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  paddingTop(30),
                  TextFieldPin(
                    textController: textEditingController,
                    autoFocus: true,
                    codeLength: _otpCodeLength,
                    alignment: MainAxisAlignment.center,
                    defaultBoxSize: 37.5,
                    margin: 7,
                    selectedBoxSize: 37.5,
                    textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: primaryColor()),
                    defaultDecoration: _pinPutDecoration.copyWith(),
                    selectedDecoration: _pinPutDecoration,
                    onChange: (code) {
                      _onOtpCallBack(code,false);
                    }
                  ),
                  paddingTop(0),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation:0,
                        backgroundColor: Colors.black,
                        disabledBackgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: _enableButton ? _onSubmitOtp : null,
                      child:  _setUpButtonChild(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verification",
        style: TextStyle(color: Colors.white,fontSize: 16),
      );
    }
  }
}