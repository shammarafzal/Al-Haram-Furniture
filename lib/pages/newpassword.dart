import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/signin.dart';
import 'package:flutter/material.dart';
import 'alertDialog.dart';
class NewPassword extends StatefulWidget {
  final token;
  NewPassword({this.token});
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _obscureText = true;
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool isLoading = false;

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
                        onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_rounded, color: Colors.black),
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
                        icon: Icon(Icons.remove_red_eye_rounded, color: Colors.black),
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
                    onPressed: () async {
                      if(_password.text == ""){
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
                      else if(_password.text != _confirmPassword.text){
                        alertScreen().showAlertDialog(context, "Password Doesn't Match");
                      }
                      else{
                        isLoading = true;
                        var response = await Utils().resetPassword(widget.token, _password.text, _confirmPassword.text);
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
                          alertScreen().showAlertDialog(context, response['message']);
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new Signin(),
                            ),
                          );

                        }
                      }
                    },
                    child: Text(
                      'Change Password',
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
            ],
          ),
        ),
      ),
    );
  }
}
