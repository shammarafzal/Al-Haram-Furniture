import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'alertDialog.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isEmptyEmail = true;
  bool isLoading = false;
  final _email = TextEditingController();
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color(getColorHexFromStr('#FEDF62')),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView(
            children: [
              Center(
                child: Text(
                  'HEY AL-Haram!',
                  style: TextStyle(color: Colors.black, fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(
                  image: AssetImage('assets/images/sofa-logo.png'),
                  width: SizeConfig.blockSizeHorizontal * 30,
                  height: SizeConfig.blockSizeVertical * 15,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black,
                    primaryColorDark: Colors.black,
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    onChanged: (text) {
                      setState(() {
                        isEmptyEmail = false;
                      });
                    },
                    controller: _email,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),

                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 5
                      ),
                      suffixIcon:  isEmptyEmail
                          ? null
                          :IconButton(
                        onPressed: () => _email.clear(),
                        icon: Icon(Icons.clear,color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: TextButton(
                    onPressed: () async{
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text);
                      if(_email.text == ""){
                        alertScreen().showAlertDialog(context, "Please Enter Email");
                      }
                      else if(emailValid == false){
                        alertScreen().showAlertDialog(context, "Please Enter Valid Email");
                      }
                      else{
                        // isLoading = true;
                        // var response = await Utils().forgot(_email.text);
                        // if(response['status'] == false && response['message'] == 'User doen\'t exists'){
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   alertScreen().showAlertDialog(context, response['message']);
                        // }
                        // else if(response['status'] == false && response['message'] == 'Connection could not be established with host mailhog :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: nodename nor servname provided, or not known'){
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   alertScreen().showAlertDialog(context, 'Error in sending Email');
                        // }
                        // else{
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   await alertScreen().showForgotAlertDialog(context, "Please check your email!!!");
                        // }
                        await alertScreen().showForgotAlertDialog(context, "Please check your email!!!");
                      }
                    },
                    child: isLoading
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        :Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  width: SizeConfig.screenWidth * 0.9,
                  height: SizeConfig.screenHeight * 0.07,
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: RichText(
                  text: TextSpan(
                      style: new TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.black,
                      ),
                      children:[
                        TextSpan(text: 'Remember Password? ',style: TextStyle(color: Colors.black45)),
                        TextSpan(text: 'SIGN IN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),recognizer: new TapGestureRecognizer()..onTap = () =>  Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new Signin(),
                          ),
                        )),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
