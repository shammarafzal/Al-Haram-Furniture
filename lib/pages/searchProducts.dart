import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertDialog.dart';

class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  bool isLoading = false;
  bool isFavorite = false;
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
        title: Text(
          'Search Products',
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Color(getColorHexFromStr('#FEDF62')),
        elevation: 0,
      ),
      body: Container(
          color: Color(getColorHexFromStr('#FEDF62')),
          child: Column(
            children: [
              SizedBox(
                height: 10,
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
                      focusedBorder: OutlineInputBorder(
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
                          fontSize: SizeConfig.safeBlockHorizontal * 5),
                      suffixIcon: isSearchProduct
                          ? null
                          : IconButton(
                              onPressed: () => _searchProduct.clear(),
                              icon: Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    child: Card(
                      elevation: 0,
                      child: FutureBuilder(
                        future: Utils().fetchProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: 12,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                            product_detail_name: 'q',
                                            product_detail_new_price: 'w',
                                            product_detail_old_price: 'w',
                                            product_detail_picture: 'w',
                                            productBrand: 'w',
                                          )));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: SizeConfig.screenWidth * 0.2,
                                          height: 150.0,
                                          child: Image.network('q'),
                                        ),
                                        // SizedBox(width: 4.0),
                                        Container(
                                          width: SizeConfig.screenWidth * 0.7,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      's',
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                          fontFamily: 'Quicksand',
                                                          color: Colors.black,
                                                          fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final SharedPreferences prefs =
                                                        await SharedPreferences.getInstance();
                                                        if(isFavorite == false){
                                                          prefs.setBool('isFav', true);
                                                          var response = await Utils().addToFavourite(1);
                                                          if(response['status'] == false){
                                                            alertScreen().showAlertDialog(context, 'Error');
                                                          }
                                                          else{
                                                            alertScreen().showAlertDialog(context, response['message']);
                                                            setState(() {
                                                              isFavorite = prefs.getBool('isFav')!;
                                                            });
                                                          }
                                                        }
                                                        else{
                                                          prefs.setBool('isFav', false);

                                                          var response = await Utils().removeFromFavourite(1);
                                                          if(response['status'] == false){
                                                            alertScreen().showAlertDialog(context, 'Error');
                                                          }
                                                          else{
                                                            alertScreen().showAlertDialog(context, response['message']);
                                                            setState(() {
                                                              isFavorite =  prefs.getBool('isFav')!;
                                                            });
                                                          }
                                                        }
                                                      },
                                                      child: Material(
                                                        elevation: isFavorite ? 0.0 : 2.0,
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        child: Container(
                                                          height: 40.0,
                                                          width: 40.0,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                              color: isFavorite
                                                                  ? Colors.grey.withOpacity(0.2)
                                                                  : Colors.white),
                                                          child: Center(
                                                            child: isFavorite == false ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 15.0),
                                              Container(
                                                width: SizeConfig.screenWidth * 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    '1',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        color: Colors.grey,
                                                        fontSize: SizeConfig.safeBlockHorizontal * 4),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 15.0),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  SizedBox(width: 35.0),
                                                  Container(
                                                    height: 40.0,
                                                    width: 50.0,
                                                    //color: Color(getColorHexFromStr('#F9C335')),
                                                    child: Center(
                                                      child: Text(
                                                        '\$ ${1}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'Quicksand',
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      print('d');
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      width: 100.0,
                                                      //  color: Color(getColorHexFromStr('#FEDD59')),
                                                      child: Center(
                                                        child: Text(
                                                          'Add to cart',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: 'Quicksand',
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                );
                              },
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  new AlwaysStoppedAnimation(Colors.red),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
