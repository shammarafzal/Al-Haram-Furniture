import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertDialog.dart';
import 'bottonNavBar.dart';
import 'forgotpassword.dart';
import 'signup.dart';
import 'package:flutter/services.dart';
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
                  style: TextStyle(
                      color: Colors.black,
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
                      primaryColor: Colors.black,
                      primaryColorDark: Colors.black,
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      onChanged: (text) {
                        setState(() {
                          isEmpty = false;
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
                        suffixIcon: isEmpty
                            ? null
                            : IconButton(
                                onPressed: () => _email.clear(),
                                icon: Icon(Icons.clear,color: Colors.black,),
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
                    primaryColor: Colors.black,
                    primaryColorDark: Colors.black,
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _password,
                    obscureText: _obscureText,
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
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 5
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black,),
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
                      color: Colors.black45,
                    ),
                  ),
                  value: checkedValue,
                  onChanged: (newValue) async {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  activeColor: Colors.black45,
                  checkColor: Colors.white,
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
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new BottomBar(),
                          ),
                        );
                        // isLoading = true;
                        // var response = await Utils().login(_email.text, _password.text);
                        // if(response['status'] == false && response['message'] == 'Invalid Password'){
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   alertScreen().showAlertDialog(context, response['message']);
                        // }
                        // else{
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   prefs.setBool('isLoggedIn', true);
                        //   await alertScreen().showSigninAlertDialog(context, "Login Successfully");
                        // }
                      }
                    },
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Sign IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                            ),
                          ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.black),
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
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black45),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.black45),
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
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'Do not have an account yet? ',
                            style: TextStyle(color: Colors.black45)),
                        TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(
                                color: Colors.black,
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
