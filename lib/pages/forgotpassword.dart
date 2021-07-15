import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView(
            children: [
              Center(
                child: Text(
                  'HEY AL-Haram!',
                  style: TextStyle(color: CustomColors().secondaryColor, fontSize: SizeConfig.safeBlockHorizontal * 8,
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
                    primaryColor: CustomColors().secondaryColor,
                    primaryColorDark: CustomColors().secondaryColor,
                  ),
                  child: TextField(
                    cursorColor: CustomColors().secondaryColor,
                    onChanged: (text) {
                      setState(() {
                        isEmptyEmail = false;
                      });
                    },
                    controller: _email,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColors().secondaryColor),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),

                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: CustomColors().secondaryColor,
                          fontSize: SizeConfig.safeBlockHorizontal * 5
                      ),
                      suffixIcon:  isEmptyEmail
                          ? null
                          :IconButton(
                        onPressed: () => _email.clear(),
                        icon: Icon(Icons.clear,color: CustomColors().secondaryColor),
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
                        isLoading = true;
                        var response = await Utils().forgot(_email.text);
                        if(response['status'] == false && response['message'] == 'User doen\'t exists'){
                          setState(() {
                            isLoading = false;
                          });
                          alertScreen().showAlertDialog(context, response['message']);
                        }
                        else if(response['status'] == false && response['message'] == 'Connection could not be established with host mailhog :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: nodename nor servname provided, or not known'){
                          setState(() {
                            isLoading = false;
                          });
                          alertScreen().showAlertDialog(context, 'Error in sending Email');
                        }
                        else{
                          setState(() {
                            isLoading = false;
                          });
                          await alertScreen().showForgotAlertDialog(context, "Please check your email!!!");
                        }
                      }
                    },
                    child: isLoading
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        :Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: CustomColors().buttonTextColor,
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(CustomColors().secondaryColor),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: CustomColors().secondaryColor),
                        ),
                      ),
                    ),
                  ),
                  width: SizeConfig.screenWidth * 0.9,
                    height:
                    MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.07 : SizeConfig.screenHeight * 0.16
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: RichText(
                  text: TextSpan(
                      style: new TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        color: CustomColors().secondaryColor,
                      ),
                      children:[
                        TextSpan(text: 'Remember Password? ',style: TextStyle(color: CustomColors().black45)),
                        TextSpan(text: 'SIGN IN',style: TextStyle(color: CustomColors().secondaryColor,fontWeight: FontWeight.bold),recognizer: new TapGestureRecognizer()..onTap = () =>  Navigator.push(
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
