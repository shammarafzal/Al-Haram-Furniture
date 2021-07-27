import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/components/customTextField.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'alertDialog.dart';

class MyAddresses extends StatefulWidget {
  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  bool isEmptyStree1 = true;
  bool isEmptyStree2 = true;
  bool isEmptyCity = true;
  bool isEmptyState = true;
  bool isEmptyPostalCode = true;
  bool isEmptyCountry = true;
  bool isLoading = false;
  final _street1 = TextEditingController();
  final _street2 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _postalCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Address',
                  style: TextStyle(color: CustomColors().secondaryColor, fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            CustomTextField(title: 'Street 1', controller: _street1),
            SizedBox(height: 15.0),
            CustomTextField(title: 'Street 2', controller: _street2),
            SizedBox(height: 15.0),
            CustomTextField(title: 'City', controller: _city),
            SizedBox(height: 15.0),
            CustomTextField(title: 'State', controller: _state),
            SizedBox(height: 15.0),
            CustomTextField(title: 'Postal Code', controller: _postalCode),

            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: TextButton(
                  onPressed: () async {
                    if(_street1.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Street 1");
                    }
                    else if(_street2.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Street 2");
                    }
                    else if(_city.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter City");
                    }
                    else if(_state.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter State");
                    }
                    else if(_postalCode.text == ""){
                      alertScreen().showAlertDialog(context, "Please Enter Postal Code");
                    }
                    else{
                      isLoading = true;
                      var response = await Utils().address(_street1.text, _street2.text, _city.text, _state.text, _postalCode.text);
                      if(response['status'] == false){
                        setState(() {
                          isLoading = false;
                        });
                        alertScreen().showAlertDialog(context, 'Error');
                      }
                      else{
                        setState(() {
                          isLoading = false;
                        });
                        alertScreen().showAlertDialog(context, 'Address Saved Successfuly');
                      }
                    }
                  },
                  child: Text(
                    'Save',
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
