import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'alertDialog.dart';
class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool _obscureText = true;
  bool isEmptyfirstName = true;
  bool isEmptylastName = true;
  bool isEmptyEmail = true;
  bool isEmptyPhone = true;
  final _fitstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _phone = TextEditingController();
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
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Color(getColorHexFromStr('#FEDF62')),
        elevation: 0,
      ),
      body: Container(
        color: Color(getColorHexFromStr('#FEDF62')),
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.black, fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold),
                ),
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
                      isEmptyfirstName = false;
                    });
                  },
                  controller: _fitstName,
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
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyfirstName
                        ? null
                        :IconButton(
                      onPressed: () => _fitstName.clear(),
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
                      isEmptylastName = false;
                    });
                  },
                  controller: _lastName,
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
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptylastName
                        ? null
                        :IconButton(
                      onPressed: () => _lastName.clear(),
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
                  enabled: false,
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
                      icon: Icon(Icons.clear,color: Colors.black,),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                      onPressed: (){
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
                      icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black,),
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
                      isEmptyPhone = false;
                    });
                  },
                  controller: _phone,
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
                    labelText: 'Phone',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyPhone
                        ? null
                        :IconButton(
                      onPressed: () => _phone.clear(),
                      icon: Icon(Icons.clear,color: Colors.black,),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),

            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: TextButton(
                  onPressed: () {
                    if(_fitstName.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter First Name");
                    }
                    else if(_password.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Password");
                    }
                    else if(_password.text.length <= 7 ){
                      alertScreen().showAlertDialog(context, "Please Length Must Greater than 8");
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

                    }
                  },
                  child: Text(
                    'Update Profile',
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

          ],
        ),
      ),
    );
  }
}