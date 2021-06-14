import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isEmptyName = true;
  bool isEmptyEmail = true;
  bool isEmptyMessage = true;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
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
                  'Contact Us',
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
                  maxLines: 5,
                  onChanged: (text) {
                    setState(() {
                      isEmptyMessage = false;
                    });
                  },
                  controller: _message,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),

                    ),
                    labelText: 'Message',
                    // / hintText: 'Enter Email',
                    suffixIcon:  isEmptyMessage
                        ? null
                        :IconButton(
                      onPressed: () => _message.clear(),
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
