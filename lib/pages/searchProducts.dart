import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getProducts.dart';
import 'package:al_haram_furnitures/components/product_list.dart';
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
  var response;
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
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
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Container(
          //color: Colors.yellow,
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

                    },
                    controller: _searchProduct,
                    textInputAction: TextInputAction.search,
                      onSubmitted: (value) async {
                        isLoading = true;
                        response = await Utils().fetchProductsBySearch(_searchProduct.text);
                        print(response.data);
                      },
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
                      suffixIcon: IconButton(
                              onPressed: () => _searchProduct.clear(),
                              icon: Icon(
                                Icons.search,
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
                      child: FutureBuilder<GetProducts>(
                        future: Utils().fetchProductsBySearch(_searchProduct.text),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.data?.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return Product(
                                  productId:  snapshot.data?.data?[index].id ?? 1,
                                  productName: snapshot.data?.data?[index].modelName ?? "",
                                  description: snapshot.data?.data?[index].description ?? "",
                                  price:  snapshot.data?.data?[index].salePrice ?? "",
                                  image_location: image_base_url+'${snapshot.data?.data?[index].productGalleries[0].productImage}',
                                  productBrand: snapshot.data?.data?[index].company.companyName ?? "",
                                );
                              },
                            );
                          }
                          return Center(
                            // child: CircularProgressIndicator(
                            //   valueColor: new AlwaysStoppedAnimation(Colors.red),
                            // ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),)
            ],
          ),),
    );
  }
}
