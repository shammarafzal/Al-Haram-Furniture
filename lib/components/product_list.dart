import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/productDetails.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            Product(
              productName: 'BOSS Revolution Chair',
              description: 'A chair is a piece ofs',
              price: '12',
              image_location: 'assets/images/ottoman.jpg',
            ),
            Product(
              productName: 'DEF',
              description: 'dscdssdcsdcsdcsdcsd esdf',
              price: '12',
              image_location: 'assets/images/anotherchair.jpg',
            ),
            Product(
              productName: 'LPM',
              description: 'dscdssdcsdcsdcsdcsd esd',
              price: '12',
              image_location: 'assets/images/chair.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String productName;
  final String description;
  final String price;
  final String image_location;
  Product({
    required this.productName,
    required this.description,
    required this.price,
    required this.image_location,
  });
  bool isFavorite = false;
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetails(
              product_detail_name: productName,
              product_detail_new_price: price,
              product_detail_old_price: price,
              product_detail_picture: image_location,
            )));
      },
      child: Row(
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth * 0.2,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image_location), fit: BoxFit.contain,

              ),
            ),
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
                        productName,
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
                        onTap: (){
                        if(isFavorite == false){
                          isFavorite = true;
                          print(isFavorite);
                        }
                        else{
                          isFavorite = false;
                          print(isFavorite);
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
                              child: isFavorite
                                  ? Icon(Icons.favorite_border)
                                  : Icon(Icons.favorite, color: Colors.red),
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
                      description,
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
                      color: Color(getColorHexFromStr('#F9C335')),
                      child: Center(
                        child: Text(
                          '\$ $price',
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
                        color: Color(getColorHexFromStr('#FEDD59')),
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
  }
}