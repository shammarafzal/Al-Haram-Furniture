import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'alertDialog.dart';
import 'signin.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  bool isEmptyName = true;
  bool isEmptyEmail = true;
  bool isLoading = false;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEY AL-Haram!',
              style: TextStyle(color: Colors.black, fontSize: SizeConfig.safeBlockHorizontal * 8,
                  fontWeight: FontWeight.bold),
            ),
            Image(
              image: AssetImage('assets/images/sofa-logo.png'),
              width: SizeConfig.blockSizeHorizontal * 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.black,
                  primaryColorDark: Colors.black,
                ),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      isEmptyName = false;
                    });
                  },
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Name',
                   // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyName
                        ? null
                        :IconButton(
                      onPressed: () => _name.clear(),
                      icon: Icon(Icons.clear),
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
                  onChanged: (text) {
                    setState(() {
                      isEmptyEmail = false;
                    });
                  },
                   controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Email',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyEmail
                        ? null
                        :IconButton(
                      onPressed: () => _email.clear(),
                      icon: Icon(Icons.clear),
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
                  controller: _password,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Password',
                    // / hintText: 'Enter Email',
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye_rounded),
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
                  controller: _confirmPassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Confirm Password',
                    // / hintText: 'Enter Email',
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye_rounded),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: TextButton(
                  onPressed: () async{
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text);
                    if(_name.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Name");
                    }
                   else if(_email.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Email");
                    }
                    else if(emailValid == false){
                      alertScreen().showAlertDialog(context, "Please Enter Valid Email");
                    }
                   else if(_password.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Password");
                    }
                    else if(_password.text.length <= 7 ){
                      alertScreen().showAlertDialog(context, "Password Length Must Greater than 8");
                    }
                    else if(_confirmPassword.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Confirm Password");
                    }
                    else if(_confirmPassword.text.length <= 7 ){
                      alertScreen().showAlertDialog(context, "Confirm Password Length Must Greater than 8");
                    }
                    else if(_password.text  !=  _confirmPassword.text){
                      alertScreen().showAlertDialog(context, "Password Does Not Match");
                    }
                    else{
                      isLoading = true;
                      var response = await Utils().register(_name.text, _email.text, _password.text, _confirmPassword.text);
                      if(response['message'] == 'The email has already been taken.'){
                        setState(() {
                          isLoading = false;
                        });
                        alertScreen().showAlertDialog(context, response['message']);
                      }
                      else{
                        setState(() {
                          isLoading = false;
                        });
                        await alertScreen().showSignupAlertDialog(context, "Registered Successfully");
                      }
                    }
                  },
                  child: isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : Text(
                    'Sign Up',
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
            RichText(
              text: TextSpan(
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  children:[
                    TextSpan(text: 'Have an account? ',style: TextStyle(color: Colors.black45)),
                    TextSpan(text: 'SIGN IN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),recognizer: new TapGestureRecognizer()..onTap = () =>  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new Signin(),
                      ),
                    )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
