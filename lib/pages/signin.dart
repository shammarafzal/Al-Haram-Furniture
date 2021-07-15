import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertDialog.dart';
import 'forgotpassword.dart';
import 'signup.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureText = true;
  bool checkedValue = true;
  bool isEmpty = true;
  bool isLoading = false;
  final _email = TextEditingController();
  final _password = TextEditingController();


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
                  style: TextStyle(
                      color: CustomColors().secondaryColor,
                      fontSize: SizeConfig.safeBlockHorizontal * 8,
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
              Center(
                child: Padding(
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
                          isEmpty = false;
                        });
                      },
                      controller: _email,
                      decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: CustomColors().secondaryColor),
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
                        suffixIcon: isEmpty
                            ? null
                            : IconButton(
                                onPressed: () => _email.clear(),
                                icon: Icon(Icons.clear,color: CustomColors().secondaryColor,),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: CustomColors().secondaryColor,
                    primaryColorDark: CustomColors().secondaryColor,
                  ),
                  child: TextField(
                    cursorColor: CustomColors().secondaryColor,
                    controller: _password,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                        borderSide:  BorderSide(color: CustomColors().secondaryColor,),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: CustomColors().secondaryColor,
                          fontSize: SizeConfig.safeBlockHorizontal * 5
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_rounded,color: CustomColors().secondaryColor,),
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: CheckboxListTile(
                  title: Text(
                    "Remember Me",
                    style: TextStyle(
                      color: CustomColors().black45,
                    ),
                  ),
                  value: checkedValue,
                  onChanged: (newValue) async {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  activeColor: CustomColors().black45,
                  checkColor: CustomColors().buttonTextColor,
                  controlAffinity: ListTileControlAffinity
                      .leading, //  <-- leading Checkbox
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_email.text);
                      if (_email.text == "") {
                        alertScreen()
                            .showAlertDialog(context, "Please Enter Email");
                      } else if (emailValid == false) {
                        alertScreen().showAlertDialog(
                            context, "Please Enter Valid Email");
                      } else if (_password.text == "") {
                        alertScreen().showAlertDialog(
                            context, "Please Enter Password");
                      } else if (_password.text.length <= 7) {
                        alertScreen().showAlertDialog(
                            context, "Please Length Must Greater than 8");
                      } else {
                        isLoading = true;
                        var response = await Utils().login(_email.text, _password.text);
                        if(response['status'] == false ){
                          setState(() {
                            isLoading = false;
                          });
                          alertScreen().showAlertDialog(context, response['message']);
                        }
                        else{
                          setState(() {
                            isLoading = false;
                          });
                          prefs.setBool('isLoggedIn', true);
                          prefs.setString('token', response['token']);
                          prefs.setInt('id', response['user']['id']);
                          await alertScreen().showSigninAlertDialog(context, "Login Successfully");
                        }
                      }
                    },
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Sign IN',
                            style: TextStyle(
                              color: CustomColors().buttonTextColor,
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                            ),
                          ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CustomColors().secondaryColor,),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: CustomColors().secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  width: SizeConfig.screenWidth * 0.9,

                  height:
                  MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.07 : SizeConfig.screenHeight * 0.16
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot my password',
                      style: TextStyle(
                        color: CustomColors().buttonTextColor,
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CustomColors().black45),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: CustomColors().black45,),
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
                      children: [
                        TextSpan(
                            text: 'Do not have an account yet? ',
                            style: TextStyle(color: CustomColors().black45,)),
                        TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(
                                color: CustomColors().secondaryColor,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (context) => new Signup(),
                                    ),
                                  )),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
