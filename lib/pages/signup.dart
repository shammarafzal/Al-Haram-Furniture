import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
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
  bool isEmptyFirstName = true;
  bool isEmptyLastName = true;
  bool isEmptyEmail = true;
  bool isLoading = false;
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

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
                        isEmptyFirstName = false;
                      });
                    },
                    controller: _firstname,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),

                      ),
                      labelText: 'First Name',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 5
                        ),
                      suffixIcon:  isEmptyFirstName
                          ? null
                          :IconButton(
                        onPressed: () => _firstname.clear(),
                        icon: Icon(Icons.clear,color: Colors.black,),
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
                    onChanged: (text) {
                      setState(() {
                        isEmptyLastName = false;
                      });
                    },
                    controller: _lastname,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),

                      ),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 5
                      ),
                      suffixIcon:  isEmptyLastName
                          ? null
                          :IconButton(
                        onPressed: () => _lastname.clear(),
                        icon: Icon(Icons.clear,color: Colors.black,),
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
                    onChanged: (text) {
                      setState(() {
                        isEmptyEmail = false;
                      });
                    },
                     controller: _email,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
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
                      fillColor: Colors.black,
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
                        onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black),
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
                    controller: _confirmPassword,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),

                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 5
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black),
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
                      if(_firstname.text == ""){
                        alertScreen().showAlertDialog(context, "Please Enter First Name");
                      }
                      else if(_lastname.text == ""){
                        alertScreen().showAlertDialog(context, "Please Enter Last Name");
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
                        var response = await Utils().register(_firstname.text, _lastname.text, _email.text, _password.text, _confirmPassword.text);
                        if(response['status'] == false){
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
