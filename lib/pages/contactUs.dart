import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'alertDialog.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isEmptyName = true;
  bool isEmptyEmail = true;
  bool isEmptyMessage = true;
  bool isLoading = false;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: CustomColors().secondaryColor)),
        backgroundColor: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        elevation: 0,
      ),
      body: Container(
        color: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        child: ListView(

          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: CustomColors().secondaryColor, fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold),
                ),
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
                      isEmptyName = false;
                    });
                  },
                  controller: _name,
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
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        color: CustomColors().secondaryColor,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyName
                        ? null
                        :IconButton(
                      onPressed: () => _name.clear(),
                      icon: Icon(Icons.clear,color: CustomColors().secondaryColor,),
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
                      icon: Icon(Icons.clear,color: CustomColors().secondaryColor,),
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
                  primaryColor: CustomColors().secondaryColor,
                  primaryColorDark: CustomColors().secondaryColor,
                ),
                child: TextField(
                  cursorColor: CustomColors().secondaryColor,
                  maxLines: 5,
                  onChanged: (text) {
                    setState(() {
                      isEmptyMessage = false;
                    });
                  },
                  controller: _message,
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
                    labelText: 'Message',
                    labelStyle: TextStyle(
                        color: CustomColors().secondaryColor,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyMessage
                        ? null
                        :IconButton(
                      onPressed: () => _message.clear(),
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
                  onPressed: () async {
                    isLoading = true;
                    var response = await Utils().contactUs(_name.text, _email.text, _message.text);
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
                  },
                  child: Text(
                    'Send',
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

          ],
        ),
      ),
    );
  }
}
