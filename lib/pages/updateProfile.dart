import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/components/customTextField.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'alertDialog.dart';
class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var user;
  bool isLoading = false;
  bool _visibleFirst = false;
  bool enabled = false;
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

  getMe() async {
    user = await Utils().getMe();
    return user;
  }
  @override
  Widget build(BuildContext context) {
    getMe();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: CustomColors().secondaryColor,)),
        backgroundColor: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        elevation: 0,
      ),
      body: Container(
        color: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        child: FutureBuilder(
          future: getMe(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                 return ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "My",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child:  Text(
                              'Update Profile',
                              style: TextStyle(color: CustomColors().secondaryColor, fontSize: SizeConfig.safeBlockHorizontal * 8,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                              //  alignment: Alignment.centerRight,
                              child: InkWell(
                                child: Icon(Icons.edit_outlined,
                                    color: CustomColors().secondaryColor),
                                onTap: () {
                                  _fitstName.text = user['first_name'];
                                  _lastName.text = user['last_name'];
                                  _email.text = user['email'];
                                  _phone.text = user['phone'];

                                  setState(() {
                                    if (_visibleFirst == false) {
                                      _visibleFirst = true;
                                      enabled = true;
                                    } else if (_visibleFirst == true) {
                                      _visibleFirst = false;
                                      enabled = false;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      CustomTextField(title: 'First Name', controller: _fitstName),
                      SizedBox(height: 15.0),
                      CustomTextField(title: 'Last Name', controller: _lastName),
                      SizedBox(height: 15.0),
                      CustomTextField(title: 'Email', controller: _email),
                      SizedBox(height: 15.0),
                      CustomTextField(title: 'Phone', controller: _phone),

                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Visibility(
                          visible: _visibleFirst,
                          child: Container(
                              child: TextButton(
                                onPressed: () async {
                                  if(_fitstName.text == ""){
                                    alertScreen().showAlertDialog(context, "Please Enter First Name");
                                  }
                                  else{
                                    isLoading = true;
                                    var response = await Utils().updateProfile(_fitstName.text,_lastName.text, _email.text, _password.text, _confirmPassword.text, _phone.text);
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
                                    }
                                  }
                                },
                                child: Text(
                                  'Update Profile',
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
                      ),
                      SizedBox(height: 15.0),

                    ],
                  );

            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(CustomColors().redicon),
              ),
            );
          },
        ),

      ),
    );
  }
}
