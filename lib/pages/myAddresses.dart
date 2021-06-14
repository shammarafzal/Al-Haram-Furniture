import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

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
  final _street1 = TextEditingController();
  final _street2 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _postalCode = TextEditingController();
  final _country = TextEditingController();

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
        child: ListView(

          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
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
                  onChanged: (text) {
                    setState(() {
                      isEmptyStree1 = false;
                    });
                  },
                  controller: _street1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Street 1',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyStree1
                        ? null
                        :IconButton(
                      onPressed: () => _street1.clear(),
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
                      isEmptyStree2 = false;
                    });
                  },
                  controller: _street2,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Street 2',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyStree2
                        ? null
                        :IconButton(
                      onPressed: () => _street2.clear(),
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
                      isEmptyCity = false;
                    });
                  },
                  controller: _city,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'City',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyCity
                        ? null
                        :IconButton(
                      onPressed: () => _city.clear(),
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
                      isEmptyState = false;
                    });
                  },
                  controller: _state,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'State',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyState
                        ? null
                        :IconButton(
                      onPressed: () => _state.clear(),
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
                      isEmptyPostalCode = false;
                    });
                  },
                  controller: _postalCode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Postal Code',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyPostalCode
                        ? null
                        :IconButton(
                      onPressed: () => _postalCode.clear(),
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
                      isEmptyCountry = false;
                    });
                  },
                  controller: _country,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Country',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyCountry
                        ? null
                        :IconButton(
                      onPressed: () => _country.clear(),
                      icon: Icon(Icons.clear),
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
                  onPressed: () {

                  },
                  child: Text(
                    'Send',
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

          ],
        ),
      ),
    );
  }
}
