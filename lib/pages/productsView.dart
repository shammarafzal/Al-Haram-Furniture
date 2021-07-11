import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertDialog.dart';
class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  bool isLoading = false;
  bool isSearchProduct = true;
  final _searchProduct = TextEditingController();
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
        child: Column(
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Colors.black,
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        onChanged: (text) async {
                          setState(() {
                            isSearchProduct = false;
                          });
                          isLoading = true;
                          var response = await Utils().search(_searchProduct.text);
                          final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setString('response', response);

                        },
                        controller: _searchProduct,
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
                          labelText: 'Search',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 5
                          ),
                          suffixIcon:  isSearchProduct
                              ? null
                              :IconButton(
                            onPressed: () => _searchProduct.clear(),
                            icon: Icon(Icons.clear,color: Colors.black,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: ListView(
                    children: [

                    ],
                  ))
                ],
              )

      ),
    );
  }
}
