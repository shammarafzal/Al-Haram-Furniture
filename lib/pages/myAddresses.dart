import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
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
  final _country = TextEditingController();


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
                      isEmptyStree1 = false;
                    });
                  },
                  controller: _street1,
                  maxLines: 2,
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
                    labelText: 'Street 1',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyStree1
                        ? null
                        :IconButton(
                      onPressed: () => _street1.clear(),
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
                      isEmptyStree2 = false;
                    });
                  },
                  controller: _street2,
                  maxLines: 2,
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
                    labelText: 'Street 2',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyStree2
                        ? null
                        :IconButton(
                      onPressed: () => _street2.clear(),
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
                      isEmptyCity = false;
                    });
                  },
                  controller: _city,
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
                    labelText: 'City',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyCity
                        ? null
                        :IconButton(
                      onPressed: () => _city.clear(),
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
                      isEmptyState = false;
                    });
                  },
                  controller: _state,
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
                    labelText: 'State',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyState
                        ? null
                        :IconButton(
                      onPressed: () => _state.clear(),
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
                      isEmptyPostalCode = false;
                    });
                  },
                  controller: _postalCode,
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
                    labelText: 'Postal Code',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),
                    suffixIcon:  isEmptyPostalCode
                        ? null
                        :IconButton(
                      onPressed: () => _postalCode.clear(),
                      icon: Icon(Icons.clear,color: Colors.black,),
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
